import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:matraka/src/models/audio_player.model.dart';
import 'package:provider/provider.dart';

class AudioControls extends StatefulWidget {
  @override
  _AudioControlsState createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> with TickerProviderStateMixin {
  // TODO: Extract this logic for use an animation and provider
  bool isPlaying = false;
  late AnimationController playAnimation;

  bool firstTime = true;

  final assetAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    playAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayer = Provider.of<AudioPlayerProvider>(context, listen: false);
    assetAudioPlayer.open(
      Audio('assets/audio/Breaking-Benjamin-Far-Away.mp3'),
      autoStart: false,
      showNotification: true,
    );

    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayer.currentDuration = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      audioPlayer.songDuration = playingAudio!.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioPlayer = Provider.of<AudioPlayerProvider>(context, listen: false);
    if (!isPlaying) audioPlayer.discAnimationController.stop();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      margin: EdgeInsets.only(top: 30, bottom: 30),
      child: Row(
        children: [
          Column(
            children: [
              Text('Far Away', style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8))),
              Text('-Breaking Benjamin-', style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.5))),
            ],
          ),
          Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xfff8cb51),
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: playAnimation,
            ),
            onPressed: () {
              // TODO: functionality
              print('Press button');
              if (isPlaying) {
                playAnimation.reverse();
                isPlaying = false;
                audioPlayer.discAnimationController.stop();
              } else {
                playAnimation.forward();
                isPlaying = true;
                audioPlayer.discAnimationController.repeat();
              }

              if (firstTime) {
                open();
                firstTime = false;
              } else {
                assetAudioPlayer.playOrPause();
              }
            },
          )
        ],
      ),
    );
  }
}

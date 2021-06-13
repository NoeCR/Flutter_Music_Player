import 'package:flutter/material.dart';
import 'package:matraka/src/models/audio_player.model.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textStyle = TextStyle(color: Colors.white.withOpacity(0.4));
    final double totalHeight = 230;
    final audioPlayer = Provider.of<AudioPlayerProvider>(context);
    final percentage = audioPlayer.percentage;
    return Container(
      padding: EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Text('${audioPlayer.songTotalDuration}', style: _textStyle),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: 3,
                height: totalHeight,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: totalHeight * percentage,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text('${audioPlayer.currentlyPlayed}', style: _textStyle),
        ],
      ),
    );
  }
}

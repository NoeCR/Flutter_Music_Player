import 'package:flutter/material.dart';
import 'package:matraka/src/widgets/audio_controls.dart';
import 'package:matraka/src/widgets/custom_appbar.dart';
import 'package:matraka/src/widgets/image_duration.dart';
import 'package:matraka/src/widgets/songs_list.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _Background(),
          Column(
            children: [
              CustomAppBar(),
              ImageDuration(),
              AudioControls(),
              SongsList(),
            ],
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screnSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: screnSize.height * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.center,
          colors: [
            // TODO: Add more colors
            Color(0xff33333e),
            Color(0xff201e28),
          ],
        ),
      ),
    );
  }
}

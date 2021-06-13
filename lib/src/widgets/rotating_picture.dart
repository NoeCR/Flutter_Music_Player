import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:matraka/src/models/audio_player.model.dart';
import 'package:provider/provider.dart';

class RotatingPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioPlayer = Provider.of<AudioPlayerProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1e1c24),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: Duration(milliseconds: 10000),
              infinite: true,
              manualTrigger: true,
              controller: (controller) => audioPlayer.discAnimationController = controller,
              child: Image(image: AssetImage('assets/img/aurora.jpg')),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black38,
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xff1c1c25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

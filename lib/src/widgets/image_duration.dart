import 'package:flutter/material.dart';
import 'package:matraka/src/widgets/progress_bar.dart';
import 'package:matraka/src/widgets/rotating_picture.dart';

class ImageDuration extends StatelessWidget {
  const ImageDuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 80),
      child: Row(
        children: [
          // TODO: Disc
          RotatingPicture(),
          SizedBox(width: 20),
          // TODO: Progress bar
          ProgressBar(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

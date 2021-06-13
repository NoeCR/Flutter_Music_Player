import 'package:flutter/material.dart';
import 'package:matraka/src/helpers/helpers.dart';

class SongsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Titles(),
    );
  }
}

class Titles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: replace with songs titles
    final titles = getLyrics();
    return Container(
      child: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,
        physics: BouncingScrollPhysics(),
        children: titles
            .map((title) => Text(title, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.6))))
            .toList(),
      ),
    );
  }
}

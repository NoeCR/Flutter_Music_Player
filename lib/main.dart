import 'package:flutter/material.dart';
import 'package:matraka/src/models/audio_player.model.dart';
import 'package:matraka/src/pages/music_player_page.dart';
import 'package:matraka/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerProvider()),
      ],
      child: MaterialApp(
        title: 'Matraka',
        theme: myTheme,
        home: MusicPlayerPage(),
      ),
    );
  }
}

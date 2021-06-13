import 'package:flutter/material.dart';
import 'package:matraka/src/helpers/print_duration.dart';

class AudioPlayerProvider with ChangeNotifier {
  bool _isPlaying = false;
  late AnimationController _discAnimationController;
  Duration _songDuration = Duration(milliseconds: 0);
  Duration _currentDuration = Duration(milliseconds: 0);

  // Getters ###################################################################
  bool get isPlaying => this._isPlaying;
  AnimationController get discAnimationController => this._discAnimationController;
  Duration get songDuration => this._songDuration;
  Duration get currentDuration => this._currentDuration;
  double get percentage => (_songDuration.inSeconds > 0) ? _currentDuration.inSeconds / _songDuration.inSeconds : 0;
  String get songTotalDuration => printDuration(_songDuration);
  String get currentlyPlayed => printDuration(_currentDuration);

  // Setters ###################################################################
  set isPlaying(bool value) {
    this._isPlaying = value;
    notifyListeners();
  }

  set discAnimationController(AnimationController controller) {
    this._discAnimationController = controller;
  }

  set songDuration(Duration duration) {
    this._songDuration = duration;
    notifyListeners();
  }

  set currentDuration(Duration duration) {
    this._currentDuration = duration;
    notifyListeners();
  }
}

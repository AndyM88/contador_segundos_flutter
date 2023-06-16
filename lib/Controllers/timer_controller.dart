import 'package:flutter/foundation.dart';

class TimerController extends ChangeNotifier {
  int _seconds = 0;
  bool _isRunning = false;

  int get seconds => _seconds;
  bool get isRunning => _isRunning;

  void startTimer() {
    _isRunning = true;
    notifyListeners();
    _updateTimer();
  }

  void stopTimer() {
    _isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    _seconds = 0;
    notifyListeners();
  }

  void _updateTimer() async {
    while (_isRunning) {
      await Future.delayed(const Duration(seconds: 1));
      if (_isRunning) {
        _seconds++;
        notifyListeners();
      }
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({super.key});

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  Timer? _timer;
  int _start = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    stopTimer();
    super.dispose();
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _start++;
      });
    });
  }

  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')} : ${minutes.toString().padLeft(2, '0')} : ${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(formatTime(_start),
        style: TextStyle(
            fontSize: 25 * MediaQuery.of(context).size.width / 360,
            fontWeight: FontWeight.w600,
            color: Colors.black87));
  }
}

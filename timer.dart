import 'dart:async';

import 'package:flutter/material.dart';
class TimerWidget extends StatefulWidget {
  final Duration timerDuration;

  TimerWidget({required this.timerDuration});

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer _timer;
  late Duration _remainingTime;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.timerDuration;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -= Duration(seconds: 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = _remainingTime.inDays;
    final hours = _remainingTime.inHours % 24;
    final minutes = _remainingTime.inMinutes % 60;
    final seconds = _remainingTime.inSeconds % 60;

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$days', style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('$hours', style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('$minutes', style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('$seconds', style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          SizedBox(height: 8.0), // Adjust the spacing between numerical values and unit texts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 2.0),
              Text('DAYS', style: TextStyle(color: Colors.white, fontSize: 12)),
              Text('HOURS', style: TextStyle(color: Colors.white, fontSize: 12)),
              Text('MINUTES', style: TextStyle(color: Colors.white, fontSize: 12)),
              Text('SECONDS', style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

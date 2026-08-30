import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrentTimeDisplay extends StatefulWidget {
  final TextStyle? textStyle; // Optional styling
  final bool isRunning;

  const CurrentTimeDisplay({
    super.key, 
    this.textStyle,
    this.isRunning = false,
    });

  @override
  _CurrentTimeDisplayState createState() => _CurrentTimeDisplayState();
}

class _CurrentTimeDisplayState extends State<CurrentTimeDisplay> {
  String currentTime = '';
  Timer? _timer = null; // Add a timer

  @override
  void initState() {
    super.initState();
    _updateTime(); // Update time initially
    if(widget.isRunning){
      _startTimer(); // Start the timer
    }
  }

  void _startTimer() {
    // Update every second
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _updateTime();
    });
  }


  void _updateTime() {
    if (mounted) { // Check if the widget is still mounted
      setState(() {
        DateTime now = DateTime.now();
        currentTime = DateFormat.Hms().format(now); // Or any other format
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      currentTime,
      style: widget.textStyle ?? const TextStyle(fontSize: 16), // Apply style or default
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';

class CountdownContainer extends StatefulWidget {
  const CountdownContainer({super.key});

  @override
  State<CountdownContainer> createState() => _CountdownContainerState();
}

class _CountdownContainerState extends State<CountdownContainer> {
  final DateTime _eventDate = DateTime.utc(2025, 9, 23, 8, 0, 0);
  late Timer _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateRemainingTime();
    _startTimer();
  }

  void _calculateRemainingTime() {
    final now = DateTime.now().toUtc();
    if (_eventDate.isAfter(now)) {
      _remainingTime = _eventDate.difference(now);
    } else {
      _remainingTime = Duration.zero;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _calculateRemainingTime();
        if (_remainingTime.inSeconds <= 0) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const PageStorageKey<String>("countdown_container"),
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffF561FA), Color.fromRGBO(0, 14, 92, 0.5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            _countDownText(
              Theme.of(context),
              "${_remainingTime.inDays}",
              "Days",
            ),
            _countDownText(
              Theme.of(context),
              "${_remainingTime.inHours % 24}",
              "Hours",
            ),
            _countDownText(
              Theme.of(context),
              "${_remainingTime.inMinutes % 60}",
              "Minutes",
            ),
            _countDownText(
              Theme.of(context),
              "${_remainingTime.inSeconds % 60}",
              "Seconds",
            ),
          ],
        ),
      ),
    );
  }
}

Widget _countDownText(ThemeData theme, String text, String text2) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: 10,
    children: [
      Text(
        text,
        style: theme.textTheme.displaySmall!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        text2,
        style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
      ),
    ],
  );
}

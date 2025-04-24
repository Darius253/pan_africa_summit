import 'package:flutter/material.dart';

class CountdownContainer extends StatefulWidget {
  const CountdownContainer({super.key});

  @override
  State<CountdownContainer> createState() => _CountdownContainerState();
}

class _CountdownContainerState extends State<CountdownContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffF561FA), Color.fromRGBO(0, 14, 92, 0.5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          _countDownText(Theme.of(context), "10", "Days"),
          _countDownText(Theme.of(context), "10", "Hours"),
          _countDownText(Theme.of(context), "10", "Minutes"),
          _countDownText(Theme.of(context), "10", "Seconds"),
        ],
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

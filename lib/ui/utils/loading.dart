import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(169, 0, 0, 0),
      child: Center(child: CircularProgressIndicator.adaptive(strokeWidth: 5)),
    );
  }
}

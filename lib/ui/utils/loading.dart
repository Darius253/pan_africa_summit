import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(169, 0, 0, 0),
      child: Center(child: CircularProgressIndicator.adaptive(strokeWidth: 5)),
    );
  }
}

import 'package:flutter/material.dart';

class WhyPaaisInfo extends StatelessWidget {
  const WhyPaaisInfo({
    super.key,
    required this.headline,
    required this.infoText,
    required this.imagePath,
  });
  final String headline;
  final String infoText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      width: 380,
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/$imagePath",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          Text(
            headline,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: Color.fromRGBO(0, 14, 92, 1),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            infoText,
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

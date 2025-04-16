import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.imagePath,
    required this.text,
  });
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: size.width,
          height: size.height,
        ),

        Container(
          width: size.width,
          height: size.height,
          color: Colors.black54,
          child: Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.7,
              left: 10,
              right: 10,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: themeData.textTheme.headlineSmall?.fontSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

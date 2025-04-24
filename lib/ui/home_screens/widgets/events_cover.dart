import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class EventsCover extends StatelessWidget {
  const EventsCover({
    super.key,
    required this.headline,
    required this.subHeadline,
    required this.date,
    required this.location,
  });
  final String headline;
  final String subHeadline;
  final String date;
  final String location;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.webp",
          width: size.width,
          height: size.height * 0.3,
          fit: BoxFit.cover,
        ),
        Container(
          width: size.width,
          height: size.height * 0.3,
          color: Color.fromRGBO(0, 14, 92, 0.5),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              GradientText(
                text: headline,
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                gradient: LinearGradient(
                  colors: [Color(0xffF561FA), Color.fromARGB(255, 203, 6, 52)],
                ),
              ),
              Text(
                subHeadline,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    date,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "||",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: const Color.fromARGB(255, 55, 245, 232),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    location,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/countdown_container.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/events_cover.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          filterQuality: FilterQuality.high,
          width: 100,
          height: 100,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          EventsCover(
            headline: "1st Pan African AI Summit 2025 (PAAiS)",
            subHeadline:
                "Harnessing ai to enhance productivity and skills to drive growth across Africa",
            date: "October 20-22, 2023",
            location: "Accra, Ghana",
          ),

          Text(
            "Event Countdown",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          CountdownContainer(),
        ],
      ),
    );
  }
}

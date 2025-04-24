import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/countdown_container.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/events_cover.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          filterQuality: FilterQuality.high,
          width: 100,
          height: 100,
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        controller: controller,
        children: [
          EventsCover(
            headline: "1st Pan African AI Summit 2025 (PAAIS)",
            subHeadline:
                "Harnessing ai to enhance productivity and skills to drive growth across Africa",
            date: "October 20-22, 2023",
            location: "Accra, Ghana",
          ),

          CountdownContainer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                GradientText(
                  text: "WHY PAAIS?",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffF561FA),
                      Color.fromARGB(255, 203, 6, 52),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

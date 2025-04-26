import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/events_page_list_tile.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        controller: controller,
        children: [
          
          const GradientText(
            text: "Meet the Visionaries Shaping Africa's AI Future",
            gradient: LinearGradient(
              colors: [Color(0xff2987F2), Color(0xffF561FA)],
            ),
          ),
          SizedBox(height: 20),
          const Text(
            "Connect with global industry leaders to build safe “glocal” ai ecosystem and take your business to the next level.",

            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          AnimatedListTile(text: "View Full Agenda"),
          const SizedBox(height: 20),
          AnimatedListTile(text: "View Speakers"),
        ],
      ),
    );
  }
}

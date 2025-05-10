import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/events_page_list_tile.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/speakers_list.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key, required this.controller});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          AnimatedListTile(
            text: "View Full Agenda",
            isAgenda: true,
            eventDays: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: PrimaryButton(
                      onPressed: () {},
                      color: theme.colorScheme.tertiaryContainer,
                      text: "Day ${index + 1}",
                      textColor: theme.colorScheme.onTertiaryContainer,
                    ),
                  );
                },
                itemCount: 2,
                shrinkWrap: true,
              ),
            ),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return _buildAgendaTile(
                  theme,
                  "Registration and Networking",
                  "8:00AM - 10:00 AM",
                  "Join us for an insightful session on the impact of AI in the finance sector. Learn from industry experts and discover the latest trends and technologies.",
                );
              },
              itemCount: 10,
              shrinkWrap: true,
            ),
          ),
          const SizedBox(height: 20),
          AnimatedListTile(
            text: "View Speakers",
            isAgenda: false,
            child: SpeakersList()
          ),
        ],
      ),
    );
  }
}

Widget _buildAgendaTile(
  ThemeData theme,
  String agenda,
  String time,
  String description,
) {
  return ListTile(
    contentPadding: const EdgeInsets.all(0),
    title: Text(
      agenda,
      style: theme.textTheme.titleLarge?.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    ),
    subtitle: Text(
      description,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
      ),
    ),
    leading: Text(
      time,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
      ),
    ),
  );
}

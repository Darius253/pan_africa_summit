import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/home_screens/about_speaker_page.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/events_page_list_tile.dart';
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
            child: GridView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              itemBuilder: (_, index) {
                return Hero(
                  tag: "speaker$index",
                  transitionOnUserGestures: true,
                  createRectTween: (begin, end) {
                    return MaterialRectCenterArcTween(begin: begin, end: end);
                  },

                  child: _buildSpeakersCard(
                    theme,
                    null,
                    "Speaker Name",
                    "Founder & CEO at DecisiveAI – Former Minister of Digital Transition and Administrative Reform of Morocco",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutSpeakerPage(),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: 5,
              shrinkWrap: true,
            ),
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

Widget _buildSpeakersCard(
  ThemeData theme,
  String? imageUrl,
  String name,
  String bio,
  Function()? onPressed,
) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: theme.colorScheme.onSecondaryContainer,
        width: 2,
      ),
      color: theme.colorScheme.secondaryContainer,
      shape: BoxShape.rectangle,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(radius: 50, backgroundColor: Colors.amber),
        GradientText(
          text: name,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
          gradient: const LinearGradient(
            colors: [Color(0xff2987F2), Color(0xffF561FA)],
          ),
        ),

        Text(
          bio,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSecondaryContainer,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        PrimaryButton(text: "View Profile", onPressed: onPressed),
      ],
    ),
  );
}

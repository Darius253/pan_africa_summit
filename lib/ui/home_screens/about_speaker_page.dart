import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class AboutSpeakerPage extends StatelessWidget {
  const AboutSpeakerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Hero(
      tag: 'speaker',
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: theme.colorScheme.onPrimary),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 5,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: CircleAvatar(
                      radius: 70,
                      foregroundImage: AssetImage(
                        "assets/images/background.webp",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 5,
                      children: [
                        GradientText(
                          text: "Speaker Name",
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          gradient: LinearGradient(
                            colors: [Color(0xff2987F2), Color(0xffF561FA)],
                          ),
                        ),

                        Text(
                          "Founder & CEO at DecisiveAI",
                          style: theme.textTheme.bodyLarge?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const SizedBox(height: 20),
              const Text(
                "About the Speaker",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text("""
          Dr. Ghita Mezzour is the Founder & CEO of DecisiveAI, a company that supports public and private organizations in the strategic adoption of artificial intelligence to achieve concrete and sustainable outcomes. She served as Morocco’s Minister of Digital Transition and Administrative Reform (2021–2024), where she led key initiatives that boosted digital education, attracted global tech companies, and launched the Digital Morocco 2030 Strategy.
          
          Before her ministerial role, she founded Data in Seconds (DASEC), an award-winning startup using AI to analyze alternative data for strategic insights. She was also an Associate Professor at the International University of Rabat, leading AI projects with international partners like USAID and NATO.
          
          Ms. Mezzour holds a PhD in Electrical & Computer Engineering from Carnegie Mellon University (United States) and a master’s in communication systems from EPFL (Switwerland). She received the EPFL Alumni Award (2023) and was named an MIT Rising Star (2015).
          """),
            ],
          ),
        ),
      ),
    );
  }
}

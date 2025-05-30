import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/select_registration_type.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/registration_type_card.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/widgets/nav_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _scrollController = ScrollController();
  late final List<Widget> cards = [
    const RegistrationTypeCard(
      title: "Delegate Pass",
      infoText: [
        "2-Day Pass to PAIAS 2025.",
        "Access to all sessions and workshops.",
        "Entry to AI exhibitions and showcase areas.",
        "Networking opportunities with industry leaders.",
        "Refreshments.",
        "Conference materials and digital post-event reports.",
        "*Complimentary event merchandise.",
      ],
    ),
    const RegistrationTypeCard(
      title: "Media Pass",
      infoText: [
        "Exclusive press conferences and media briefings.",
        "Interviews with speakers and industry leaders.",
        "Reserved media seating and workspaces.",
      ],
      description: [
        "Journalists from print, digital, and broadcast media.",
        "AI and tech bloggers.",
        "Content creators and digital influencers.",
        "Documentary filmmakers and podcasters.",
      ],
    ),
    const RegistrationTypeCard(
      title: "Volunteer Pass",
      infoText: [
        "Event logistics, registrations, and guest management.",
        "Technical support.",
        "Guiding delegates and exhibitors.",
      ],
      description: [
        "University students and young professionals.",
        "AI and tech enthusiasts looking for networking opportunities.",
        "Individuals passionate about event management.",
      ],
    ),
  ];

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            key: const PageStorageKey("registration_page"),
            children: <Widget>[
              AnimatedContainer(
                clipBehavior: Clip.hardEdge,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                height: isVisible ? 350 : 0,
                width: size.width,
                color: Color(0xFF06004C),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      const GradientText(
                        text: "REGISTER WITH US FOR THE PAN AFRICAN AI SUMMIT",
                        gradient: LinearGradient(
                          colors: [Color(0xff2987F2), Color(0xffF561FA)],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        """Whether you’re attending as a delegate, media representative, or volunteer,this summit offers an unparalleled opportunity to be part of Africa’s AI revolution.
                        """,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 7,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  "assets/images/ticket.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Free Registration",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "To ensure a diverse and high-impact audience, all registrations will go through a short vetting process. Approved participants will receive a confirmation email with further details.",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Divider(
                color: theme.colorScheme.onSurface,
                height: 20,
                thickness: 1,
              ),
              SizedBox(
                height: 700,
                width: size.width,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: cards.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 20),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => cards[index],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: NavigationButton(
                  icon: Icons.arrow_forward,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectRegistrationType(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

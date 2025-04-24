import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/select_registration_type.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/widgets/nav_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          key: PageStorageKey("registration_page"),
          children: <Widget>[
            Container(
              height: 400,
              width: 400,
              color: Color(0xFF06004C),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GradientText(
                      text: "REGISTER WITH US FOR THE PAN AFRICAN AI SUMMIT",
                      gradient: LinearGradient(
                        colors: [Color(0xff2987F2), Color(0xffF561FA)],
                      ),
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
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

            Align(
              alignment: Alignment.bottomRight,
              child: NavigationButton(
                icon: Icons.arrow_forward,
                onTap: () {
                  Navigator.pushReplacement(
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
    );
  }
}

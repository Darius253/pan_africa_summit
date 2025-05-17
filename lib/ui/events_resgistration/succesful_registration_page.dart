import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/home_screens/home_page.dart';

class SuccesfulRegistrationPage extends StatefulWidget {
  const SuccesfulRegistrationPage({super.key});

  @override
  State<SuccesfulRegistrationPage> createState() =>
      _SuccesfulRegistrationPageState();
}

class _SuccesfulRegistrationPageState extends State<SuccesfulRegistrationPage> {
  late ConfettiController _controllerCenterLeft;
  late ConfettiController _controllerCenterRight;

  @override
  void initState() {
    super.initState();

    _controllerCenterLeft = ConfettiController(
      duration: const Duration(seconds: 10),
    );
    _controllerCenterLeft.play();

    _controllerCenterRight = ConfettiController(
      duration: const Duration(seconds: 10),
    );
    _controllerCenterRight.play();
  }

  @override
  void dispose() {
    _controllerCenterLeft.dispose();
    _controllerCenterRight.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: GestureDetector(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: (10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20,
                  children: [
                    Text(
                      "Congratulations! \nYou have successfully registered for the event",
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add Event to your Calendar",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: theme.colorScheme.onSurface,
                          decorationThickness: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    PrimaryButton(
                      onPressed:
                          () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          ),
                      text: "Back to Home",
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ConfettiWidget(
                  confettiController: _controllerCenterRight,
                  blastDirection: pi, // radial value - LEFT
                  particleDrag: 0.05, // apply drag to the confetti
                  emissionFrequency: 0.05, // how often it should emit
                  numberOfParticles: 20, // number of particles to emit
                  gravity: 0.01, // gravity - or fall speed
                  shouldLoop: false,
                  strokeWidth: 1,
                  strokeColor: Colors.white,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ConfettiWidget(
                  confettiController: _controllerCenterLeft,
                  blastDirection: 0, // radial value - RIGHT
                  emissionFrequency: 0.5,
                  particleDrag: 0.05,
                  numberOfParticles: 20,
                  gravity: 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

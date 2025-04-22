import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/utils/loading.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          LottieBuilder.asset(
            'assets/lottie/background.json',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
            repeat: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,

                children: [
                  PrimaryButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      // Simulate a network call
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    },
                    text: "Sign In with Google",
                    color: Colors.transparent,
                    icon: Image.asset(
                      'assets/images/google.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  PrimaryButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                      });
                      // Simulate a network call
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    },
                    text: "Sign In with Apple",
                    icon: Icon(Icons.apple, size: 25, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading) LoadingPage(),
        ],
      ),
    );
  }
}

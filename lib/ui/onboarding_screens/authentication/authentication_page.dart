import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/snack_bar.dart';
import 'package:pan_african_ai_summit/ui/home_screens/home_page.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/authentication/authentication_view_model.dart';
import 'package:pan_african_ai_summit/ui/utils/loading.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key, required this.authenticationViewModel});

  final AuthenticationViewModel authenticationViewModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          LottieBuilder.asset(
            'assets/lottie/background.json',
            width: double.infinity,
            height: size.height,
            fit: BoxFit.cover,
            repeat: true,
          ),
          ListenableBuilder(
            listenable: authenticationViewModel,
            builder: (context, _) {
              if (authenticationViewModel.isLoading) {
                return const Loading();
              }
              if (authenticationViewModel.errorMessage != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  CustomSnackBar.show(
                    context,
                    authenticationViewModel.errorMessage!,
                    isError: true,
                  );
                });
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,

                    children: [
                      PrimaryButton(
                        onPressed: () async {
                          await authenticationViewModel.signInWithGoogle();
                          if (authenticationViewModel.isSignedIn) {
                            if (context.mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                              CustomSnackBar.show(
                                context,
                                "Sign In Successful",
                              );
                            }
                          }
                        },
                        text: "Sign In with Google",
                        color: Colors.transparent,
                        icon: Image.asset(
                          'assets/images/google.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      // PrimaryButton(
                      //   onPressed: () {
                      //     Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => HomePage()),
                      //     );
                      //   },
                      //   text: "Sign In with Apple",
                      //   icon: Icon(Icons.apple, size: 25, color: Colors.white),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

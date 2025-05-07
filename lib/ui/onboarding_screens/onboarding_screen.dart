import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/authentication/authentication_page.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/authentication/authentication_view_model.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/widgets/nav_button.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/widgets/onboarding_item.dart';
import 'package:shimmer/shimmer.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Widget> _onboardingItems = [];

  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _onboardingItems = [
      const OnBoardingItem(
        imagePath: "assets/images/onboarding_1.jpg",
        text:
            "Hear from renowned experts and visionaries as they share their insights on the transformative potential of AI in Africa.",
      ),
      const OnBoardingItem(
        imagePath: "assets/images/onboarding_2.jpg",
        text:
            "Engage in thought-provoking dialogues on the challenges, opportunities, and ethical considerations surrounding the deployment of AI technologies.",
      ),
      const OnBoardingItem(
        imagePath: "assets/images/onboarding_3.jpg",
        text:
            "Connect with a diverse community of AI enthusiasts, policymakers, entrepreneurs, and researchers, fostering valuable partnerships and collaborations.",
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            key: const PageStorageKey("onboarding_page"),
            scrollDirection: Axis.horizontal,
            controller: pageController,
            children: _onboardingItems,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
          ),
          currentPage == _onboardingItems.length - 1
              ? Align(
                alignment: Alignment.centerRight,
                child: NavigationButton(
                  icon: Icons.arrow_forward,
                  color:
                      currentPage == _onboardingItems.length - 1
                          ? Color(0xffF561FA)
                          : Colors.black,
                  onTap: () {
                    if (currentPage < _onboardingItems.length - 1) {
                      setState(() {
                        currentPage = currentPage + 1;
                      });
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => AuthenticationPage(
                                authenticationViewModel:
                                    AuthenticationViewModel(),
                              ),
                        ),
                      );
                      setState(() {
                        currentPage = 0;
                      });
                    }
                  },
                ),
              )
              : SizedBox(),

          Align(
            alignment: Alignment.center,
            child: Shimmer.fromColors(
              baseColor: Color(0xff2987F2),
              highlightColor: Color(0xffF561FA),
              child: switch (currentPage) {
                0 => const Text(" Swipe >>"),
                1 => const Text("<< Swipe >>"),
                2 => const Text("<< Swipe"),

                _ => const Text("Swipe"),
              },
            ),
          ),
        ],
      ),
    );
  }
}

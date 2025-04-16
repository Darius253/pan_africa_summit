import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/designate_registration/contact_information.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/designate_registration/personal_information.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/designate_registration/travel_information.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/snack_bar.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/widgets/nav_button.dart';

class DesignateRegisteration extends StatefulWidget {
  const DesignateRegisteration({super.key});

  @override
  State<DesignateRegisteration> createState() => _DesignateRegisterationState();
}

class _DesignateRegisterationState extends State<DesignateRegisteration> {
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Stack(
          children: [
            PageView(
              // key: Key("DesignateRegistrationPageView"),
              onPageChanged:
                  (value) => setState(() {
                    currentIndex = value;
                  }),
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                PersonalInformation(),
                ContactInformation(),
                TravelInformation(),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex != 0
                      ? NavigationButton(
                        icon: Icons.arrow_back,
                        onTap: () {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                      )
                      : const SizedBox(),

                  currentIndex != 2
                      ? NavigationButton(
                        icon: Icons.arrow_forward,
                        onTap: () {
                          if (!formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            if (currentIndex != 2) {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                              setState(() {
                                currentIndex = 1;
                              });
                            } else {
                              // Handle form submission or navigation to the next screen
                            }
                          } else {
                            CustomSnackBar.show(
                              context,
                              'Please fill in all fields correctly.',
                              isError: true,
                            );
                          }
                        },
                      )
                      : PrimaryButton(onPressed: () {}, text: "Complete"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

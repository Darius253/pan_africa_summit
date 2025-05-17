import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/succesful_registration_page.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/drop_down.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/snack_bar.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/text_field.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/travel_info_with_radio_buttons.dart';
import 'package:pan_african_ai_summit/ui/home_screens/widgets/system_alerts.dart';

class VolunteerRegistrationPage extends StatelessWidget {
  const VolunteerRegistrationPage({
    super.key,

    required this.scrollController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.organisationController,
    required this.designationController,
    required this.mobileNumberController,
    required this.onAreasOfInterestChanged,
    this.selectedAreasOfInterest,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController organisationController;
  final TextEditingController designationController;
  final TextEditingController mobileNumberController;
  final ScrollController scrollController;
  final Function(String?) onAreasOfInterestChanged;
  final String? selectedAreasOfInterest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final formKey = GlobalKey<FormState>();
    final List<String> areasOfInterest = [
      "Print",
      "TV",
      "Radio",
      "Online",
      "Freelance",
      "Other",
    ];

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          controller: scrollController,
          children: [
            const Text(
              "Volunteer Pass Registration",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Expanded(
                  child: TextFields(
                    labelText: "First Name",
                    controller: firstNameController,
                  ),
                ),
                Expanded(
                  child: TextFields(
                    labelText: "Last Name",
                    controller: lastNameController,
                  ),
                ),
              ],
            ),

            TextFields(
              labelText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            TextFields(
              labelText: "Mobile Number (Include Country Code)",
              controller: mobileNumberController,
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: false,
              ),
            ),

            CustomDropdown(
              labelText: "Areas of Interest",
              items: areasOfInterest,
              onChanged: onAreasOfInterestChanged,
              value: selectedAreasOfInterest,
              theme: Theme.of(context),
            ),
            TravelInfoWithRadioButtons(
              question:
                  "Are you available for the full duration of the summit?",
            ),
            TravelInfoWithRadioButtons(
              question: "Are you available for pre-event preparations?",
            ),
            TravelInfoWithRadioButtons(
              question:
                  "Do you have any prior experience volunteering at events?",
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: PrimaryButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // showLoadingDialog(context);
                    // Handle form submission

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => const SuccesfulRegistrationPage(),
                      ),
                    );

                    CustomSnackBar.show(
                      context,
                      "Registration Completed Successfully",
                      isError: false,
                    );
                    sendNotification(
                      context: context,
                      title: "PAAIS",
                      body:
                          "You are attending the PAAIS Summit on 25th October, 2025",
                      theme: theme,
                    );
                  } else {
                    CustomSnackBar.show(
                      context,
                      "Please fill in all fields correctly.",
                      isError: true,
                    );
                  }
                },
                text: "Complete Registration",
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

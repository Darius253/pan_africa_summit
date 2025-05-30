import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/succesful_registration_page.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/drop_down.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/primary_button.dart';
import 'package:pan_african_ai_summit/ui/utils/snack_bar.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/text_field.dart';
import 'package:pan_african_ai_summit/ui/utils/system_alerts.dart';

class MediaRegistrationPage extends StatelessWidget {
  const MediaRegistrationPage({
    super.key,

    required this.scrollController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.organisationController,
    required this.designationController,
    required this.mobileNumberController,
    required this.onMediaTypeChanged,
    required this.onCoverageTypeChanged,
    this.selectedMediaType,
    this.selectedCoverageType,
    required this.systemAlerts,
  });
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController organisationController;
  final TextEditingController designationController;
  final TextEditingController mobileNumberController;
  final ScrollController scrollController;
  final Function(String?) onMediaTypeChanged;
  final Function(String?) onCoverageTypeChanged;
  final String? selectedMediaType;
  final String? selectedCoverageType;
  final SystemAlerts systemAlerts;

   static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   
    final theme = Theme.of(context);
    final List<String> mediaTypes = [
      "Print",
      "TV",
      "Radio",
      "Online",
      "Freelance",
      "Other",
    ];

    final List<String> coverageTypes = [
      "Event Reporting",
      "Photograph/Videography",
      "Social Media",
      "Interviews with Speakers & Attendees",
      "Live Streaming",
      "Other",
    ];

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          children: [
            const Text(
              "Media Pass Registration",
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
            TextFields(
              labelText: "Media Organisation",
              controller: organisationController,
            ),
            TextFields(
              labelText: "Delegation",
              controller: designationController,
            ),
            CustomDropdown(
              labelText: "Media Type",
              items: mediaTypes,
              onChanged: onMediaTypeChanged,
              value: selectedMediaType,
              theme: Theme.of(context),
            ),
            CustomDropdown(
              labelText: "Coverage Type",
              items: coverageTypes,
              onChanged: onCoverageTypeChanged,
              value: selectedCoverageType,
              theme: Theme.of(context),
            ),
            SizedBox(height: 20),

            Align(
              alignment: Alignment.bottomRight,
              child: PrimaryButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
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
                    systemAlerts.sendNotification(
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

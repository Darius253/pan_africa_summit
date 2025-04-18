import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/drop_down.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/text_field.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.organisationController,
    required this.positionController,
    required this.scrollController,
    required this.onSectorChanged,
    required this.onGenderChanged,
    this.selectedSector,
    this.selectedGender,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController organisationController;
  final TextEditingController positionController;
  final ScrollController scrollController;
  final Function(String?) onSectorChanged;
  final Function(String?) onGenderChanged;

  final String? selectedSector;
  final String? selectedGender;

  @override
  Widget build(BuildContext context) {
    final List<String> sectors = [
      "Government",
      "Private Sector",
      "Non-Governmental Organisation",
      "International Organisation",
    ];

    final List<String> genders = ["Male", "Female", "Other"];
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            "Personal Information",
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
            labelText: "Organisation/Institution",
            controller: organisationController,
          ),
          TextFields(
            labelText: "Position/Delgation",
            controller: positionController,
          ),
          CustomDropdown(
            labelText: "Sector",
            items: sectors,
            onChanged: onSectorChanged,
            value: selectedSector,
            theme: Theme.of(context),
          ),
          CustomDropdown(
            labelText: "Gender",
            items: genders,
            onChanged: onGenderChanged,
            value: selectedGender,
            theme: Theme.of(context),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

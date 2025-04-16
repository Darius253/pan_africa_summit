import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/drop_down.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/text_field.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _organisationController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // _firstNameController.dispose();
    // _lastNameController.dispose();
    // _emailController.dispose();
    // _organisationController.dispose();
    // _positionController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  List<String> sectors = [
    "Government",
    "Private Sector",
    "Non-Governmental Organisation",
    "International Organisation",
  ];

  List<String> genders = ["Male", "Female", "Other"];

  String? selectedSector;
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
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
                  controller: _firstNameController,
                ),
              ),
              Expanded(
                child: TextFields(
                  labelText: "Last Name",
                  controller: _lastNameController,
                ),
              ),
            ],
          ),

          TextFields(
            labelText: "Email",
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFields(
            labelText: "Organisation/Institution",
            controller: _organisationController,
          ),
          TextFields(
            labelText: "Position/Delgation",
            controller: _positionController,
          ),
          CustomDropdown(
            labelText: "Sector",
            items: sectors,
            onChanged: (value) {
              setState(() {
                selectedSector = value;
              });
            },
            value: selectedSector,
          ),
          CustomDropdown(
            labelText: "Gender",
            items: genders,
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
            },
            value: selectedGender,
          ),
        ],
      ),
    );
  }
}

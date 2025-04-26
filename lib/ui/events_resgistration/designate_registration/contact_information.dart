import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/text_field.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({
    super.key,
    required this.nationalityController,
    required this.mobileNumberController,
    required this.countryOfResidenceController,
    required this.emergencyContactController,
    required this.emergencyContactPhoneController,
    required this.scrollController,
  });

  final TextEditingController nationalityController;
  final TextEditingController mobileNumberController;
  final TextEditingController countryOfResidenceController;
  final TextEditingController emergencyContactController;
  final TextEditingController emergencyContactPhoneController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        const Text(
          "Contact Information",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        TextFields(
          labelText: "Nationality",
          controller: nationalityController,
          keyboardType: TextInputType.text,
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
          labelText: "Country of Residence",
          controller: countryOfResidenceController,
          keyboardType: TextInputType.text,
        ),
        TextFields(
          labelText: "Emergency Contact Name",
          controller: emergencyContactController,
          keyboardType: TextInputType.name,
        ),
        TextFields(
          labelText: "Emergency Contact Phone Number (Include Country Code)",
          controller: emergencyContactPhoneController,
          keyboardType: const TextInputType.numberWithOptions(
            signed: true,
            decimal: false,
          ),
        ),
        const SizedBox(height: 60),
      ],
    );
  }
}

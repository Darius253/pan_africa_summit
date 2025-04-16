import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/text_field.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key, this.controller});
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            "Contact Information",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          TextFields(
            labelText: "Nationality",
            controller: TextEditingController(),
            keyboardType: TextInputType.text,
          ),

          TextFields(
            labelText: "Mobile Number",
            controller: TextEditingController(),
            keyboardType: TextInputType.phone,
          ),

          TextFields(
            labelText: "Country of Residence",
            controller: controller ?? TextEditingController(),
            keyboardType: TextInputType.text,
          ),
          TextFields(
            labelText: "Emergency Contact Name",
            controller: TextEditingController(),
            keyboardType: TextInputType.name,
          ),
          TextFields(
            labelText: "Emergency Contact Phone Number",
            controller: TextEditingController(),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}

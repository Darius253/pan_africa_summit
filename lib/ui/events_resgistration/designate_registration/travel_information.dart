import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/travel_info_with_checkbox.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/travel_info_with_radio_buttons.dart';

class TravelInformation extends StatelessWidget {
  const TravelInformation({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            "Travel & Special Requirements",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          TravelInfoWithRadioButtons(
            question: "Do you require a Visa on Arrival?",
          ),
          TravelInfoWithRadioButtons(
            question: "Do you need assistance with your Visa Application?",
          ),
          TravelInfoWithRadioButtons(
            question: "Do you have any Dietary Requirements?",
          ),

          TravelInfoWithCheckbox(
            question: "Accessibility Requirements",
            options: [
              "Wheelchair Access",
              "Sign Language Interpretation",
              "None",
            ],
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

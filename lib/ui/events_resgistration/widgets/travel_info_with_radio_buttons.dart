import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/custom_radio_button.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/required_questions.dart';

class TravelInfoWithRadioButtons extends StatefulWidget {
  const TravelInfoWithRadioButtons({super.key, required this.question});
  final String question;

  @override
  State<TravelInfoWithRadioButtons> createState() =>
      _TravelInfoWithRadioButtonsState();
}

class _TravelInfoWithRadioButtonsState
    extends State<TravelInfoWithRadioButtons> {
  CustomRadioButtonType? _groupValue; // Default value

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      key: Key(widget.question),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RequiredQuestions(question: widget.question, theme: theme),

        CustomRadioButton(
          value: CustomRadioButtonType.yes,
          onChanged: (CustomRadioButtonType? value) {
            setState(() {
              _groupValue = CustomRadioButtonType.yes;
            });
          },
          text: "Yes",
          groupValue: _groupValue,
          theme: theme,
        ),
        CustomRadioButton(
          value: CustomRadioButtonType.no,
          onChanged: (CustomRadioButtonType? value) {
            setState(() {
              _groupValue = CustomRadioButtonType.no;
            });
          },
          text: "No",
          groupValue: _groupValue,
          theme: theme,
        ),
      ],
    );
  }
}

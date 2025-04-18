import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/custom_checkbox.dart';
import 'package:pan_african_ai_summit/ui/authentication_pages/widgets/required_questions.dart';

enum CheckboxOption { wheelchairAccess, signLanguageInterpretation, none }

class TravelInfoWithCheckbox extends StatefulWidget {
  const TravelInfoWithCheckbox({
    super.key,
    required this.question,
    required this.options,
  });
  final String question;
  final List<String> options;

  @override
  State<TravelInfoWithCheckbox> createState() => _TravelInfoWithCheckboxState();
}

class _TravelInfoWithCheckboxState extends State<TravelInfoWithCheckbox> {
  final Set<String> _selectedOptions = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key(widget.question),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RequiredQuestions(question: widget.question, theme: Theme.of(context)),
        ...widget.options.map((option) {
          return CustomCheckbox(
            value: _selectedOptions.contains(option),
            option: option,
            onChanged: (value) {
              setState(() {
                if (value == true) {
                  _selectedOptions.add(option);
                } else {
                  _selectedOptions.remove(option);
                }
              });
            },
            selectedOptions: _selectedOptions,
          );
        }),
      ],
    );
  }
}

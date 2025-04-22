import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/events_resgistration/widgets/required_questions.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType,
  });
  final String labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        RequiredQuestions(question: labelText, theme: theme),

        TextFormField(
          controller: controller,

          maxLines: 1,
          keyboardType: keyboardType ?? TextInputType.text,
          textInputAction: TextInputAction.done,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $labelText';
            }
            return null;
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
          },
          onSaved: (newValue) {
            controller.text = newValue ?? '';
          },
        ),
      ],
    );
  }
}

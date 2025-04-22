import 'package:flutter/material.dart';

class RequiredQuestions extends StatelessWidget {
  const RequiredQuestions({
    super.key,
    required this.question,
    required this.theme,
  });
  final String question;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: question,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),

        children: [
          TextSpan(
            text: " *",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}

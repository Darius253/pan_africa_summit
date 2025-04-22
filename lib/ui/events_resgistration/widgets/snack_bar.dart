import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    final theme = Theme.of(context);
    final snackBarColor =
        isError ? theme.colorScheme.error : theme.colorScheme.primaryContainer;
    final textColor =
        isError
            ? theme.colorScheme.onError
            : theme.colorScheme.onPrimaryContainer;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackBarColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 3),
        content: Text(
          message,
          style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
        ),
      ),
    );
  }
}

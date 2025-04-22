import 'package:flutter/material.dart';

enum CustomRadioButtonType { yes, no }

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.text,
    required this.groupValue,
    required this.theme,
  });
  final CustomRadioButtonType value;
  final void Function(CustomRadioButtonType?)? onChanged;
  final String text;
  final CustomRadioButtonType? groupValue;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Transform.scale(
        scale: 1.3,
        child: Radio<CustomRadioButtonType>(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          value: value,
          splashRadius: 10,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ),
      title: Text(
        text,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}

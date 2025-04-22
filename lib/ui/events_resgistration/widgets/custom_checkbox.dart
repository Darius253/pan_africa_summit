import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.option,
    required this.onChanged,
    required this.selectedOptions,
    required this.value,
  });
  final String option;
  final void Function(bool?)? onChanged;
  final Set<String> selectedOptions;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Transform.scale(
        scale: 1.3,
        child: Checkbox.adaptive(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
          value: value,
          splashRadius: 10,
          onChanged: onChanged,
        ),
      ),
      title: Text(
        option,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}

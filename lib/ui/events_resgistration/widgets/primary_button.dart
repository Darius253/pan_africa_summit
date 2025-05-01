import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.icon,
    this.textColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final Widget? icon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color ?? const Color(0xFF06004C),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child:
          icon != null
              ? ListTile(
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 0,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                leading: icon,
                title: Text(
                  text,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              : Text(
                text,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
    );
  }
}

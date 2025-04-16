import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.color,
  });
  final IconData icon;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.black,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(child: Icon(icon, color: Colors.white, size: 35)),
      ),
    );
  }
}

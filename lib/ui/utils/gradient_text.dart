import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    required this.gradient,
  });
  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback:
          (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: Text(
        text,
        style:
            style ??
            theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        textAlign: textAlign,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({super.key, required this.text, required this.theme});
  final String text;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xffF561FA),
      highlightColor: Color(0xff2987F2),
      period: const Duration(milliseconds: 500),
      child: Text(text, style: theme.textTheme.titleLarge),
    );
  }
}

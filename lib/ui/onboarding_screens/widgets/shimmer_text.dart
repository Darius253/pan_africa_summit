import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Shimmer.fromColors(
      baseColor: Color(0xffF561FA),
      highlightColor: Color(0xff2987F2),
      child: Text(text, style: theme.textTheme.titleLarge),
    );
  }
}

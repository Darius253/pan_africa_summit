import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/ui/utils/gradient_text.dart';

class AnimatedListTile extends StatefulWidget {
  const AnimatedListTile({
    super.key,
    required this.text,
    required this.child,
    this.eventDays,
    required this.isAgenda,
  });
  final String text;
  final Widget child;
  final Widget? eventDays;
  final bool isAgenda;

  @override
  State<AnimatedListTile> createState() => _AnimatedListTileState();
}

class _AnimatedListTileState extends State<AnimatedListTile> {
  bool isRotated = false;

  void _toggleRotation() {
    setState(() {
      isRotated = !isRotated;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          onTap: _toggleRotation,
          title: GradientText(
            text: widget.text,
            gradient: const LinearGradient(
              colors: [Color(0xffF561FA), Color.fromARGB(255, 203, 6, 52)],
            ),
          ),
          trailing: AnimatedRotation(
            turns: isRotated ? 0.25 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Icon(
              Icons.arrow_forward,
              color: Color.fromARGB(255, 203, 6, 52),
              size: 30,
            ),
          ),
        ),
        if (widget.isAgenda && isRotated) widget.eventDays ?? const SizedBox(),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isRotated ? 500 : 0,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: theme.colorScheme.secondaryContainer,
          ),
          child: isRotated ? widget.child : null,
        ),
      ],
    );
  }
}

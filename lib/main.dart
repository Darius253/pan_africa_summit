import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/theme.dart';
import 'package:pan_african_ai_summit/ui/onboarding_screens/onboarding_screen.dart';
import 'package:pan_african_ai_summit/util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Poppins", "Lato");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Pan African AI Summit',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      theme: brightness == Brightness.light ? theme.light() : theme.dark(),

      home: const OnBoardingScreen(),
    );
  }
}

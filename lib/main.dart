import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/firebase_options.dart';
import 'package:pan_african_ai_summit/theme.dart';
import 'package:pan_african_ai_summit/util.dart';
import 'package:pan_african_ai_summit/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

      home: Wrapper(),
      
    );
  }
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pan_african_ai_summit/firebase_options.dart';
import 'package:pan_african_ai_summit/theme.dart';
import 'package:pan_african_ai_summit/ui/notification_controller.dart';
import 'package:pan_african_ai_summit/util.dart';
import 'package:pan_african_ai_summit/ui/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _initialiseAwesomeNotifications();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Poppins", "Lato");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      navigatorKey: MyApp.navigatorKey,
      title: 'Pan African AI Summit',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Wrapper());
      },

      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      theme: brightness == Brightness.light ? theme.light() : theme.dark(),

      home: Wrapper(),
    );
  }
}

Future<void> _initialiseAwesomeNotifications() async {
  await AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Colors.transparent,
        ledColor: Colors.white,
      ),
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group',
      ),
    ],
    debug: true,
  );
}

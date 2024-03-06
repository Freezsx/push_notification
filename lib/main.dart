import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notification/firebase_api.dart';
import 'package:push_notification/firebase_options.dart';
import 'package:push_notification/page/home_page.dart';
import 'package:push_notification/page/notification_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      navigatorKey: navigatorKey,
      home: MyHomePage(),
      routes: {
        NotificationPage.route: (context) => const NotificationPage(),
      },

    );
  }
}
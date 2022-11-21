import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instafire/constants/colors.dart';
import 'package:instafire/responsive/mobile_layout.dart';
import 'package:instafire/responsive/responsive_layout.dart';
import 'package:instafire/responsive/web_layout.dart';

import 'firebase_options.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      title: 'Insta App',
      // home: ResponsiveLayout(
      //   mobileScreenLayout: MobileScreen(),
      //   webScr(eenLayout: WebScreen(),
      // ),
      home: login(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Insta'),
//       ),
//     );
//   }
// }

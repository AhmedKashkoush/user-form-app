import 'package:flutter/material.dart';
import 'package:user_form/extensions/theme_extension.dart';
import 'package:user_form/screens/splash_screen.dart';

class UserFormApp extends StatelessWidget {
  const UserFormApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Form',
      debugShowCheckedModeBanner: false,
      theme: context.lightTheme,
      darkTheme: context.darkTheme,
      home: const SplashScreen(),
    );
  }
}

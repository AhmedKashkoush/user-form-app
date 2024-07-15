import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_form/extensions/navigation_extension.dart';
import 'package:user_form/models/user.dart';
import 'package:user_form/screens/form_screen.dart';
import 'package:user_form/screens/info_screen.dart';
import 'package:user_form/screens/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SharedPreferences _prefs;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LogoWidget(
          size: 120,
        ),
      ),
    );
  }

  void _init() async {
    _prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2), () async {
      final Map<String, dynamic> data =
          jsonDecode(_prefs.getString('user') ?? "{}");
      if (data.isEmpty) {
        context.pushReplacement(const FormScreen());
      } else {
        User user = User.fromJson(data);
        context.pushReplacement(
          InfoScreen(
            user: user,
          ),
        );
      }
    });
  }
}

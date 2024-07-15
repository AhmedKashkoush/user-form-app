import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_form/extensions/navigation_extension.dart';
import 'package:user_form/extensions/space_extension.dart';
import 'package:user_form/models/user.dart';
import 'package:user_form/screens/info_screen.dart';
import 'package:user_form/screens/widgets/custom_app_bar.dart';
import 'package:user_form/screens/widgets/custom_button.dart';
import 'package:user_form/screens/widgets/form_widget.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late final SharedPreferences _prefs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _fNameController,
      _lNameController,
      _emailController,
      _addressController,
      _ageController;

  @override
  void initState() {
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _ageController = TextEditingController();
    _init();
    super.initState();
  }

  void _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            FormWidget(
              fNameController: _fNameController,
              lNameController: _lNameController,
              emailController: _emailController,
              addressController: _addressController,
              ageController: _ageController,
            ),
            20.h,
            CustomButton(
              text: 'Submit',
              onPressed: () => _submit(context),
            ),
          ],
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final User user = User(
        fName: _fNameController.text.trim(),
        lName: _lNameController.text.trim(),
        email: _emailController.text.trim(),
        address: _addressController.text.trim(),
        age: int.parse(
          _ageController.text.trim(),
        ),
      );

      _prefs
          .setString(
        'user',
        jsonEncode(
          user.toJson(),
        ),
      )
          .then((_) {
        context.pushReplacement(
          InfoScreen(
            user: user,
          ),
        );
      });
    }
  }
}

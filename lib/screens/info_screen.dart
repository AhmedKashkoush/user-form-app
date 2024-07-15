import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_form/extensions/navigation_extension.dart';
import 'package:user_form/extensions/space_extension.dart';
import 'package:user_form/models/user.dart';
import 'package:user_form/screens/form_screen.dart';
import 'package:user_form/screens/widgets/custom_app_bar.dart';
import 'package:user_form/screens/widgets/custom_button.dart';
import 'package:user_form/screens/widgets/custom_list_tile.dart';

class InfoScreen extends StatelessWidget {
  final User user;
  const InfoScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CustomListTile(
            leading: const Icon(CupertinoIcons.person),
            title: 'Full name',
            subtitle: '${user.fName} ${user.lName}',
          ),
          10.h,
          CustomListTile(
            leading: const Icon(CupertinoIcons.number),
            title: 'Age',
            subtitle: '${user.age}',
          ),
          10.h,
          CustomListTile(
            leading: const Icon(CupertinoIcons.mail),
            title: 'Email',
            subtitle: user.email,
          ),
          10.h,
          CustomListTile(
            leading: const Icon(CupertinoIcons.location_solid),
            title: 'Address',
            subtitle: user.address,
            isThreeLine: true,
          ),
          20.h,
          CustomButton(
            text: 'Sign another form',
            onPressed: () => _goToFormScreen(context),
          ),
        ],
      ),
    );
  }

  void _goToFormScreen(BuildContext context) {
    context.pushReplacement(const FormScreen());
  }
}

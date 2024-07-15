import 'package:flutter/material.dart';
import 'package:user_form/extensions/space_extension.dart';
import 'package:user_form/extensions/theme_extension.dart';
import 'package:user_form/screens/widgets/logo_widget.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
  }) : super(
          title: Builder(builder: (context) {
            return Row(
              children: [
                const LogoWidget(
                  size: 40,
                ),
                14.w,
                Text(
                  'User Form',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }),
        );
}

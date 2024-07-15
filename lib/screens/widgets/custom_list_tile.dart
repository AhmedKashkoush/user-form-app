import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leading, trailing;
  final String title;
  final String? subtitle;
  final bool isThreeLine;
  const CustomListTile({
    super.key,
    this.leading,
    this.trailing,
    required this.title,
    this.subtitle,
    this.isThreeLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: subtitle == null ? null : Text(subtitle!),
      isThreeLine: isThreeLine,
      trailing: trailing,
      tileColor: Colors.grey.shade300.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}

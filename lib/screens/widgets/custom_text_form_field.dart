import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final SharpFrom sharpFrom;
  final Widget? prefixIcon, suffixIcon;
  final TextEditingController? controller;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines, maxLines, maxLength;
  const CustomTextFormField({
    super.key,
    this.sharpFrom = SharpFrom.none,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.labelText,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: sharpFrom == SharpFrom.start
              ? const BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(25),
                )
              : sharpFrom == SharpFrom.end
                  ? const BorderRadius.horizontal(
                      left: Radius.circular(25),
                      right: Radius.circular(10),
                    )
                  : const BorderRadius.all(
                      Radius.circular(25),
                    ),
        ),
      ),
      validator: validator,
    );
  }
}

enum SharpFrom {
  start,
  end,
  none,
}

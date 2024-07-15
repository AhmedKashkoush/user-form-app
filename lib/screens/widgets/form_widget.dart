import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:user_form/extensions/email_validation_extension.dart';
import 'package:user_form/extensions/space_extension.dart';
import 'package:user_form/screens/widgets/custom_text_form_field.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.fNameController,
    required this.lNameController,
    required this.emailController,
    required this.addressController,
    required this.ageController,
  });

  final TextEditingController fNameController,
      lNameController,
      emailController,
      addressController,
      ageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                labelText: 'First Name',
                prefixIcon: const Icon(CupertinoIcons.person),
                sharpFrom: SharpFrom.end,
                controller: fNameController,
                validator: _nameValidator,
              ),
            ),
            10.w,
            Expanded(
              child: CustomTextFormField(
                labelText: 'Last Name',
                sharpFrom: SharpFrom.start,
                controller: lNameController,
                validator: _nameValidator,
              ),
            ),
          ],
        ),
        10.h,
        CustomTextFormField(
          labelText: 'Age',
          maxLength: 3,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          prefixIcon: const Icon(CupertinoIcons.number),
          controller: ageController,
          validator: _ageValidator,
        ),
        10.h,
        CustomTextFormField(
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(CupertinoIcons.mail),
          controller: emailController,
          validator: _emailValidator,
        ),
        10.h,
        CustomTextFormField(
          labelText: 'Address',
          minLines: 3,
          maxLines: null,
          keyboardType: TextInputType.streetAddress,
          prefixIcon: const Icon(CupertinoIcons.location_solid),
          controller: addressController,
          validator: _addressValidator,
        ),
      ],
    );
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field required';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? _ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field required';
    }

    if (int.tryParse(value) == null) {
      return 'Age must be a number';
    }

    if (int.parse(value) <= 0 || int.parse(value) > 100) {
      return 'Age must be between 1 and 100';
    }

    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field required';
    }

    if (!value.isEmail) {
      return 'Invalid email';
    }

    return null;
  }

  String? _addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field required';
    }

    return null;
  }
}

// ignore_for_file: body_might_complete_normally_nullable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/constant.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.icon,
    required this.labelText,
    this.onChange,
    this.isHide = false,
    this.controller,
  });
  TextEditingController? controller;
  final IconData icon;
  final String labelText;
  final void Function(String)? onChange;
  final bool isHide;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHide,
      onChanged: onChange,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is requer';
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.2),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: buildTextFieldStyle(kSecondaryColor),
        enabledBorder: buildTextFieldStyle(Colors.white),
        border: buildTextFieldStyle(Colors.white),
      ),
    );
  }

  OutlineInputBorder buildTextFieldStyle(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

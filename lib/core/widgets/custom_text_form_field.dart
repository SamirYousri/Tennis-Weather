import 'package:flutter/material.dart';
import 'package:helping_a_tennis_player/core/utils/constant.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.icon, required this.labelText});
  final IconData icon;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

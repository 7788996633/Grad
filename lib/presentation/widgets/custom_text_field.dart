import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild(
      {super.key,
      required this.text,
      required this.controller,
      required this.validator,
      required this.color});
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: color,
      ),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SimpleTextDecoration extends StatelessWidget {
  final TextEditingController? controller;
  final String Function(String?)? validator;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final Color? colors;

  SimpleTextDecoration(
      {this.controller,
      this.validator,
      this.hintText,
      this.prefixIcon,
      this.obscureText,
      this.suffixIcon,
      this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey)),
            hintText: hintText,
            suffixIcon: Icon(suffixIcon),
            prefixIcon: Icon(
              prefixIcon,
              color: colors,
            )),
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

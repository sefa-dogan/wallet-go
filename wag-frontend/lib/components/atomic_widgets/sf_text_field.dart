// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';

class SFTextField extends StatelessWidget {
  SFTextField(
      {super.key,
      this.title,
      required this.autofocus,
      required this.onChanged,
      required this.keyboardType,
      required this.onTap,
      this.obscureText = false,
      this.hintText,
      this.endIcon,
      this.errorText,
      this.controller,
      this.maxLength,
      this.hintStyle,
      this.readOnly,
      this.enabledBorder,
      this.border,
      this.constraints,
      this.enabled});

  String? title;
  String? hintText;

  ///This usually use for iconbutton
  Widget? endIcon;
  String? errorText;
  TextInputType keyboardType;
  bool autofocus;
  bool? enabled;
  TextEditingController? controller;
  bool obscureText;
  int? maxLength;
  TextStyle? hintStyle;
  BoxConstraints? constraints;
  InputBorder? border;
  InputBorder? enabledBorder;
  bool? readOnly;
  Function(String) onChanged;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: AppIntValues.TEN),
        child: Text(title ?? ""),
      ),
      subtitle: TextField(
        readOnly: readOnly ?? false,
        enabled: enabled,
        controller: controller,
        autofocus: autofocus,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(
          constraints: constraints,
          hintStyle: hintStyle,
          hintText: hintText,
          suffixIcon: endIcon,
          errorText: errorText,
          border: border,
          enabledBorder: enabledBorder,
        ),
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}

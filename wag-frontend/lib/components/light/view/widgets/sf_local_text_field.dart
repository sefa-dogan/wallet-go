import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';

// ignore: must_be_immutable
class SFLocalTextField extends StatelessWidget {
  SFLocalTextField(
      {super.key,
      required this.readOnly,
      this.borderColor,
      this.borderRadius,
      this.hintText,
      this.hintTextColor,
      this.suffixIcon,
      this.constraints,
      this.onTap,
      this.onChanged,
      this.controllerText,
      this.enabled});

  bool readOnly;
  String? hintText;
  Color? hintTextColor;
  Widget? suffixIcon;
  Color? borderColor;
  double? borderRadius;
  VoidCallback? onTap;
  Function(String)? onChanged;
  BoxConstraints? constraints;
  String? controllerText;
  bool? enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      controller: TextEditingController(text: controllerText),
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
          constraints: constraints,
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
          ),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? AppColor.appBlack),
              borderRadius: BorderRadius.circular(borderRadius ?? 0)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.appGrey),
              borderRadius: BorderRadius.circular(borderRadius ?? 0))),
    );
  }
}

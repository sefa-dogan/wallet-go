import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:masked_text_field/masked_text_field.dart';

// ignore: must_be_immutable
class SFMaskedTextField extends StatelessWidget {
  SFMaskedTextField(
      {super.key,
      this.title,
      required this.autofocus,
      required this.onChanged,
      required this.mask,
      required this.controller,
      required this.keyboardType,
      this.maxLength,
      this.hintText,
      this.endIcon,
      this.errorText,
      // this.initialText,
      this.enabled});
  String? title;
  String? hintText;
  IconButton? endIcon;
  String? errorText;
  String mask;
  int? maxLength;
  bool autofocus;
  bool? enabled;
  TextInputType keyboardType;
  TextEditingController controller;
  Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: AppIntValues.TEN),
        child: Text(title ?? ""),
      ),
      subtitle: MaskedTextField(
        
        keyboardType:keyboardType,
        mask: mask,
        autofocus: autofocus,
        maxLength: maxLength ?? 100,
        onChange: onChanged,
        textFieldController: controller,
        inputDecoration: InputDecoration(
            hintText: hintText,
            suffixIcon: endIcon,
            errorText: errorText,
            border: const OutlineInputBorder()),
      ),
    );
  }
}

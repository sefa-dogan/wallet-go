// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';

class SFElevatedButton extends StatelessWidget {
  SFElevatedButton(
      {super.key,
      required this.childEB,
      required this.onPressedEB,
      this.color = AppColor.appBlue,
      this.borderColor,
      this.size});

  Widget childEB;
  Function()? onPressedEB;
  Color color;
  Color? borderColor;
  Size? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ButtonStyle(
        
        shadowColor: const MaterialStatePropertyAll(AppColor.appTransparent),
        side: borderColor != null
            ? MaterialStateBorderSide.resolveWith((Set<MaterialState> states) {
                return BorderSide(color: borderColor!);
              })
            : null,
        fixedSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color.fromARGB(255, 77, 92, 130);
            }
            return color;
          },
        ),
      ),
      onPressed: onPressedEB,
      child: childEB,
    );
  }
}

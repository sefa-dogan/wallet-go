import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

// ignore: must_be_immutable
class SFCustomAlert extends StatelessWidget {
  SFCustomAlert({
    super.key,
    this.exception,
    required this.message,
    required this.actions,
    required this.imagePath,
  });

  Exception? exception;
  String imagePath;
  String message;
  List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppIntValues.TEN)),
      title: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.width / 5,
            child: Image.asset(imagePath),
          ),
          const Text(AppStrings.WE_ARE_SAD)
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Text(message)),
        ],
      ),
      actions: actions,
    );
  }
}

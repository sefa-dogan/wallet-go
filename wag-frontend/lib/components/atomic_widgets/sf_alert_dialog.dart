import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';

class SFAlertDialog {
  Future showAlertDialog(BuildContext context,
      {String buttonText = "",
      String title = "",
      String content = "",
      Widget? icon}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: icon,
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          title: Center(child: Text(title)),
          content: Text(content),
          actions: [
            SFElevatedButton(
              childEB: Text(buttonText),
              onPressedEB: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}

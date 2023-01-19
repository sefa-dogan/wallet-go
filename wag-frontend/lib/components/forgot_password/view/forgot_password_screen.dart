import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/forgot_password/view/widgets/forgot_password_form.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SFAppBar().appBar(AppStrings.FORGOT_PASSWORD),
      body: Column(
        children: [
          ForgotPasswordForm(
            
          ),
        ],
      ),
    );
  }
}

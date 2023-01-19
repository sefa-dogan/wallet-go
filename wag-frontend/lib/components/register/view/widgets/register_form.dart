import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/register/viewmodel/register_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:super_tooltip/super_tooltip.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final viewmodel = locator<RegisterViewModel>();
  final _padding = const EdgeInsets.all(AppIntValues.TEN);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        children: [
          Observer(builder: (_) {
            return SFTextField(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              errorText: viewmodel.showErrorMessageUsername &&
                      viewmodel.username.isEmpty
                  ? AppStrings.ERROR_MESSAGE_USERNAME
                  : null,
              keyboardType: TextInputType.text,
              title: AppStrings.USERNAME,
              hintText: AppStrings.ENTER_USERNAME,
              autofocus: false,
              onChanged: viewmodel.setUsername,
              onTap: () => viewmodel.showErrorMessageUsername = true,
            );
          }),
          Observer(builder: (_) {
            return SFTextField(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              errorText:
                  viewmodel.showErrorMessageName && viewmodel.name.isEmpty
                      ? AppStrings.ERROR_MESSAGE_NAME
                      : null,
              keyboardType: TextInputType.text,
              title: AppStrings.NAME,
              hintText: AppStrings.ENTER_NAME,
              autofocus: false,
              onChanged: viewmodel.setName,
              onTap: () => viewmodel.showErrorMessageName = true,
            );
          }),
          Observer(builder: (_) {
            return SFTextField(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              errorText:
                  viewmodel.showErrorMessageSurname && viewmodel.surname.isEmpty
                      ? AppStrings.ERROR_MESSAGE_SURNAME
                      : null,
              keyboardType: TextInputType.text,
              title: AppStrings.SURNAME,
              hintText: AppStrings.ENTER_SURNAME,
              autofocus: false,
              onChanged: viewmodel.setSurname,
              onTap: () => viewmodel.showErrorMessageSurname = true,
            );
          }),
          Observer(builder: (_) {
            return SFTextField(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              errorText:
                  viewmodel.showErrorMessageTcNo && viewmodel.tcno.isEmpty
                      ? AppStrings.ERROR_MESSAGE_TC_NO
                      : null,
              keyboardType: TextInputType.number,
              maxLength: 11,
              controller: MaskedTextController(
                  mask: "00000000000", text: viewmodel.tcno),
              title: AppStrings.TC_NO,
              hintText: AppStrings.ENTER_TC_NO,
              autofocus: false,
              onChanged: viewmodel.setTcNo,
              onTap: () => viewmodel.showErrorMessageTcNo = true,
            );
          }),
          Observer(builder: (_) {
            return SFTextField(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              errorText:
                  viewmodel.showErrorMessageEmail && viewmodel.email.isEmpty
                      ? AppStrings.ERROR_MESSAGE_EMAIL
                      : null,
              keyboardType: TextInputType.emailAddress,
              title: AppStrings.E_MAIL,
              hintText: AppStrings.ENTER_E_MAIL,
              endIcon: IconButton(
                icon: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.questionCircleColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: const Icon(
                      Icons.question_mark,
                      color: AppColor.questionCircleColor,
                    )),
                onPressed: () => SuperTooltip(
                  popupDirection: TooltipDirection.left,
                  shadowBlurRadius: 100,
                  borderColor: AppColor.appTransparent,
                  content: const Text("Your email adress that you want"),
                ).show(context),
              ),
              autofocus: false,
              onChanged: viewmodel.setEmail,
              onTap: () => viewmodel.showErrorMessageEmail = true,
            );
          }),
          Observer(builder: (_) {
            return SFTextField(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              errorText: viewmodel.showErrorMessagePassword &&
                      viewmodel.password.isEmpty
                  ? AppStrings.ERROR_MESSAGE_PASSWORD
                  : null,
              keyboardType: TextInputType.number,
              title: AppStrings.PASSWORD,
              hintText: AppStrings.ENTER_PASSWORD,
              obscureText: viewmodel.hidePassword,
              maxLength: 15,
              endIcon: IconButton(
                icon: viewmodel.hidePassword
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: AppColor.questionCircleColor,
                      )
                    : const Icon(Icons.visibility_outlined,
                        color: AppColor.questionCircleColor),
                onPressed: () {
                  viewmodel.hidePassword = !viewmodel.hidePassword;
                },
              ),
              autofocus: false,
              onChanged: viewmodel.setPassword,
              onTap: () => viewmodel.showErrorMessagePassword = true,
            );
          }),
        ],
      ),
    );
  }
}

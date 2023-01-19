import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/components/personal_details/viewmodel/personal_details_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PersonalDetailsList extends StatelessWidget {
  PersonalDetailsList({super.key}) {
    viewmodel.nameAndSurname =
        "${userStore.userInfo.name} ${userStore.userInfo.surname}";
    viewmodel.email = userStore.userInfo.email;
    viewmodel.tcno = userStore.userInfo.tcno;
  }

  final userStore = locator<UserStore>();
  final viewmodel = locator<PersonalDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(children: [
          Observer(builder: (_) {
            return SFTextField(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              errorText: viewmodel.showErrorMessageNameAndSurname &&
                      viewmodel.nameAndSurname.isEmpty
                  ? AppStrings.ERROR_MESSAGE_NAME_SURNAME
                  : null,
              onTap: () => viewmodel.showErrorMessageNameAndSurname = true,
              keyboardType: TextInputType.text,
              enabled: viewmodel.isEditing,
              autofocus: false,
              onChanged: (value) {
                viewmodel.nameAndSurname = value;
              },
              controller: viewmodel.isEditing
                  ? null
                  : TextEditingController(text: viewmodel.nameAndSurname),
              title: AppStrings.NAME_AND_SURNAME,
            );
          }),
          Observer(builder: (_) {
            return SFTextField(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              errorText:
                  viewmodel.showErrorMessageEmail && viewmodel.email.isEmpty
                      ? AppStrings.ERROR_MESSAGE_EMAIL
                      : null,
              onTap: () => viewmodel.showErrorMessageEmail = true,
              keyboardType: TextInputType.emailAddress,
              enabled: viewmodel.isEditing,
              title: AppStrings.E_MAIL,
              autofocus: false,
              controller: viewmodel.isEditing
                  ? null
                  : TextEditingController(text: viewmodel.email),
              onChanged: (value) {
                viewmodel.email = value;
              },
            );
          }),
          Observer(builder: (_) {
            return SFTextField(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              keyboardType: TextInputType.number,
              onTap: () => viewmodel.showErrorMessageTcNo = true,
              errorText:
                  viewmodel.showErrorMessageTcNo && viewmodel.tcno.isEmpty
                      ? AppStrings.ERROR_MESSAGE_TC_NO
                      : null,
              enabled: viewmodel.isEditing,
              title: AppStrings.TC_NO,
              maxLength: 11,
              autofocus: false,
              controller: viewmodel.isEditing
                  ? null
                  : MaskedTextController(
                      text: viewmodel.tcno, mask: "00000000000"),
              onChanged: (value) {
                viewmodel.tcno = value;
              },
            );
          }),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(AppIntValues.TEN),
              child: SFTextButton(
                buttonChild: const Text(
                  AppStrings.RESET_PASSWORD,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColor.appBlue),
                ),
                onPressedFunc: () {},
              ),
            ),
          )
        ]),
      ),
    );
  }
}

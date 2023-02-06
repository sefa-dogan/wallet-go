import 'package:email_validator/email_validator.dart';
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
              onTap: () => viewmodel.isEditing = true,
              keyboardType: TextInputType.text,
              // enabled: viewmodel.isEditing,
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
              errorText: EmailValidator.validate(viewmodel.email)
                  ? null
                  : AppStrings.ERROR_MESSAGE_EMAIL,
              onTap: () => viewmodel.isEditing = true,
              keyboardType: TextInputType.emailAddress,
              // enabled: viewmodel.isEditing,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(AppIntValues.TEN),
              child: SFTextButton(
                buttonChild:  Text(
                  AppStrings.RESET_PASSWORD,
                  style: const TextStyle(
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

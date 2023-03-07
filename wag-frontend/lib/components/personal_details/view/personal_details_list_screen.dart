// ignore: import_of_legacy_library_into_null_safe
// ignore_for_file: use_build_context_synchronously, duplicate_ignore, import_of_legacy_library_into_null_safe

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_toast.dart';
import 'package:flutter_boilerplate/components/personal_details/view/widgets/personal_details_list.dart';
import 'package:flutter_boilerplate/components/personal_details/viewmodel/personal_details_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/exceptions/null_exception.dart';
import 'package:flutter_boilerplate/core/exceptions/surname_exception.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PersonalDetailsListScreen extends StatelessWidget {
  PersonalDetailsListScreen({super.key});

  final viewmodel = locator<PersonalDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return WillPopScope(
      onWillPop: () {
        Get.offNamed(AppRoutes.PROFILE_SCREEN);
        return Future<bool>.value(true);
      },
      child: Scaffold(
        appBar: SFAppBar().appBar(
          AppStrings.PERSONAL_DETAILS,
          onPressedLeading: () {
            viewmodel.isEditing = false;
            Get.offNamed(AppRoutes.PROFILE_SCREEN);
          }, 
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersonalDetailsList(),
            Padding(
              padding: const EdgeInsets.all(AppIntValues.TEN),
              child: Row(
                children: [
                  Expanded(
                    child: SFElevatedButton(
                      size: const Size(0, AppIntValues.FIFTY),
                      childEB: Text(
                        AppStrings.APPLY,
                        style: const TextStyle(color: AppColor.appWhite),
                      ),
                      onPressedEB: () async {
                        bool isSuccess = false;
                        if (EmailValidator.validate(viewmodel.email)) {
                          viewmodel.isEditing = false;
                          await Get.showOverlay(
                            asyncFunction: () async {
                              try {
                                isSuccess = await viewmodel.updateUserInfo();
                              } on SurnameException catch (surnameExp) {
                                showDialog(
                                  context: context,
                                  builder: (context) => SFCustomAlert(
                                      title: AppStrings.WARNING,
                                      exception: surnameExp,
                                      message:
                                          AppStrings.ERROR_MESSAGE_NAME_SURNAME,
                                      actions: [
                                        SFElevatedButton(
                                          childEB: Text(
                                            AppStrings.OK,
                                            style: const TextStyle(
                                                color: AppColor.appBlue),
                                          ),
                                          onPressedEB: () => Get.back(),
                                          color: AppColor.appWhite,
                                        )
                                      ],
                                      imagePath: AppStrings.EXCLAMATION_ICON),
                                );
                              } on NullException catch (nullExp) {
                                
                                showDialog(
                                  context: context,
                                  builder: (context) => SFCustomAlert(
                                      title: AppStrings.WARNING,
                                      exception: nullExp,
                                      message: AppStrings.MISSING_INFORMATION,
                                      actions: [
                                        SFElevatedButton(
                                          childEB: Text(
                                            AppStrings.OK,
                                            style: const TextStyle(
                                                color: AppColor.appBlue),
                                          ),
                                          onPressedEB: () => Get.back(),
                                          color: AppColor.appWhite,
                                        )
                                      ],
                                      imagePath: AppStrings.EXCLAMATION_ICON),
                                );
                              } catch (exp) {
                                showDialog(
                                  context: context,
                                  builder: (context) => SFCustomAlert(
                                      title: AppStrings.WARNING,
                                      exception: Exception(),
                                      message: AppStrings.UPDATE_FAILED,
                                      actions: [
                                        SFElevatedButton(
                                          childEB: Text(
                                            AppStrings.OK,
                                            style: const TextStyle(
                                                color: AppColor.appBlue),
                                          ),
                                          onPressedEB: () => Get.back(),
                                          color: AppColor.appWhite,
                                        )
                                      ],
                                      imagePath: AppStrings.EXCLAMATION_ICON),
                                );
                              }
                            },
                            loadingWidget: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            opacity: 0.5,
                            opacityColor: AppColor.appOverlayColor,
                          );
                        
                          isSuccess
                              ? showAnimatedDialog(
                                context: context, 
                                builder: (context) => Center(
                                child: Container(
                                  color: AppColor.appWhite,
                                  width: Get.mediaQuery.size.width*0.5,
                                  height: Get.mediaQuery.size.width*0.5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    height:
                                        MediaQuery.of(context).size.width / 5,
                                    child: Image.asset(AppStrings.CHECK_ICON)),
                                      const Text(
                                        "Updated!",
                                      style: TextStyle(fontSize: AppIntValues.TWENTY),
                                      ),
                                      SFElevatedButton(
                                                      childEB: Text(AppStrings.OK),
                                                      onPressedEB: () => Get.back(),
                                                    ),
                                    ],
                                  ),
                                ),
                              ),
                              barrierDismissible: true,
                              animationType:DialogTransitionType.scale,
                              duration: const Duration(milliseconds: 200),
                               )
                               : null;
                        } else {
                          fToast.showToast(
                              child: SFToast(
                                  message: AppStrings.ERROR_MESSAGE_EMAIL),
                              toastDuration: const Duration(seconds: 2),
                              gravity: ToastGravity.CENTER);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

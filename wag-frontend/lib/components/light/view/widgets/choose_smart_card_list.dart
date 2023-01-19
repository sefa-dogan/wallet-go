import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_gesture_row.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
// import 'package:flutter_boilerplate/components/login/model/app_account.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class ChooseSmartCardList extends StatelessWidget {
  ChooseSmartCardList({super.key});

  final viewmodel = locator<LightViewModel>();
  final userStore = locator<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppIntValues.TWENTY,
          right: AppIntValues.TWENTY,
          top: AppIntValues.TWENTY),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(text: AppStrings.CHOOSE_YOUR_SMART_CARD),
              SFIconButton(
                iconIconButton: Icons.close,
                iconColor: AppColor.appPaleGrey,
                onPressedIconButton: () => Get.back(),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: AppIntValues.TWENTY, bottom: AppIntValues.TWENTY),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                AppStrings.SMART_CARDS_UPPERCASE,
                                style: TextStyle(color: AppColor.appTextGrey),
                              )
                            ],
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(top: AppIntValues.TEN),
                            height: MediaQuery.of(context).size.height / 4,
                            child: ListView.builder(
                              itemCount: userStore.appAccounts.length,
                              itemBuilder: (context, index) {
                                return Observer(builder: (_) {
                                  return SFGestureRow(
                                    padding: const EdgeInsets.only(
                                        top: AppIntValues.TEN,
                                        bottom: AppIntValues.TEN),
                                    title: userStore.appAccounts[index].name,
                                    trailingWidget: const Text(
                                      AppStrings.SHORT_CARD_NUMBER,
                                      style: TextStyle(
                                          color: AppColor.appPaleGrey),
                                    ),
                                    borderColor:
                                        viewmodel.indexSmartCard == index
                                            ? AppColor.appBlue
                                            : AppColor.appTransparent,
                                    onTap: () {
                                      viewmodel.indexSmartCard = index;
                                      viewmodel.selectedAppAccount =
                                          userStore.appAccounts[index];
                                    },
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SFElevatedButton(
                              size: const Size(0, AppIntValues.FIFTY),
                              borderColor: AppColor.appBlue,
                              color: AppColor.appWhite,
                              childEB: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      AppStrings.ADD_NEW_CARD,
                                      style: TextStyle(color: AppColor.appBlue),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: AppColor.appBlue,
                                    )
                                  ]),
                              onPressedEB: () => viewmodel.controller
                                  .animateToPage(
                                      viewmodel
                                          .pageIndexAddNewPaymentMethodForm,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeInOut),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppIntValues.TEN),
                        child: Row(
                          children: [
                            Expanded(
                              child: Observer(builder: (_) {
                                return SFElevatedButton(
                                  childEB: const Text(AppStrings.CONTINUE),
                                  onPressedEB: viewmodel.indexSmartCard != null
                                      ? () =>
                                          viewmodel.setSmartCardTextFieldText()
                                      : null,
                                  size: const Size(
                                      0,
                                      AppIntValues
                                          .FIFTY), // row' a genişletildiği için width değeirnin bir önemi kalmaz
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

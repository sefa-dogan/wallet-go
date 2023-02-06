import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChoosePaymentMethodList extends StatelessWidget {
  ChoosePaymentMethodList({super.key});
  final radius = AppIntValues.TEN;
  final viewmodel = locator<LightViewModel>();
  final userStore = locator<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppIntValues.TWENTY),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(text: AppStrings.CHOOSE_PAYMENT_METHOD),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: AppColor.appPaleGrey,
                  ))
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppIntValues.TEN, bottom: AppIntValues.TEN),
                      child: Row(
                        children:  [
                          Text(
                            AppStrings.EXISTING_CARDS,
                            style: const TextStyle(color: AppColor.appTextGrey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: AppIntValues.TEN),
                          child: Observer(builder: (_) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  side: viewmodel.indexPaymentMethod == 0
                                      ? const BorderSide(
                                          color: AppColor.appBlue)
                                      : BorderSide.none,
                                  borderRadius: BorderRadius.circular(radius)),
                              shadowColor: AppColor.appTransparent,
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(radius)),
                                tileColor: AppColor.appGrey,
                                leading: const Icon(Icons.adb),
                                title: Row(
                                    children: [Text(userStore.wallet.name)]),
                                onTap: () {
                                  viewmodel.indexPaymentMethod = 0;
                                },
                              ),
                            );
                          }),
                        )))
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Observer(builder: (_) {
                  return SFElevatedButton(
                      size: const Size(0, AppIntValues.FIFTY),
                      childEB: Text(viewmodel.indexPaymentMethod != null
                          ? AppStrings.CONTINUE
                          : AppStrings.PAY_FROM_BALANCE),
                      onPressedEB: () => viewmodel.indexPaymentMethod != null
                          ? viewmodel.setPaymentMethodTextFieldText()
                          : () {});
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/* class ChoosePaymentMethodList {
  List paymentMethods = ["", "", "", "", "", ""];
  final radius = AppIntValues.TEN;
  final viewmodel = locator<LightViewModel>();
  getPageViewModel(BuildContext context) {
    return PageViewModel(
        decoration: PageDecoration(
            boxDecoration: BoxDecoration(
                // shape: BoxShape.rectangle,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(radius)))),
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SFText(text: AppStrings.CHOOSE_PAYMENT_METHOD),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: AppColor.appPaleGrey,
                ))
          ],
        ),
        bodyWidget: Column(
          children: [
            Row(
              children: const [
                Text(
                  AppStrings.EXISTING_CARDS,
                  style: TextStyle(color: AppColor.appTextGrey),
                ),
              ],
            ),
            SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Expanded(
                    child: ListView.builder(
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppIntValues.TEN),
                      child: Observer(builder: (_) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              side: viewmodel.indexPaymentMethod == index
                                  ? const BorderSide(color: AppColor.appBlue)
                                  : BorderSide.none,
                              borderRadius: BorderRadius.circular(radius)),
                          shadowColor: AppColor.appTransparent,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(radius)),
                            tileColor: AppColor.appGrey,
                            leading: const Icon(Icons.adb),
                            title: Row(children: const [Text("****** 1234")]),
                            onTap: () {
                              viewmodel.indexPaymentMethod = index;
                            },
                          ),
                        );
                      }),
                    );
                  },
                )))
          ],
        ),
        footer: Column(
          children: [
            SFElevatedButton(
              size: Size(MediaQuery.of(context).size.width, 50),
              borderColor: AppColor.appBlue,
              color: AppColor.appWhite,
              childEB: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      AppStrings.ADD_NEW_PAYMENT_METHOD,
                      style: TextStyle(color: AppColor.appBlue),
                    ),
                    Icon(
                      Icons.add,
                      color: AppColor.appBlue,
                    )
                  ]),
              onPressedEB: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppIntValues.TEN),
              child: SFElevatedButton(
                size: Size(MediaQuery.of(context).size.width, 50),
                childEB: const Text(AppStrings.CONTINUE),
                onPressedEB: () => showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ChooseSmartCardList();
                  },
                ),
              ),
            )
          ],
        ));
  }
}
 */
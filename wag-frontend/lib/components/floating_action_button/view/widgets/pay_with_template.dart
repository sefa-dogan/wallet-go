import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text.dart';
import 'package:flutter_boilerplate/components/floating_action_button/viewmodel/sf_floating_action_button_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PayWithTemplate extends StatelessWidget {
  PayWithTemplate({super.key});
  final radius = AppIntValues.TEN;
  final viewmodel = locator<SFFloatingActionButtonViewModel>();
  List cards = ["", "", ""];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppIntValues.TWENTY),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () => viewmodel.controller.previousPage(
                      duration: const Duration(seconds: 1), curve: Curves.easeInOut),
                ),
                SFText(text: AppStrings.PAY_WITH_TEMPLATE)
              ]),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColor.appPaleGrey,
                ),
                onPressed: () => Get.back(),
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          AppStrings.TEMPLATES,
                          style: TextStyle(color: AppColor.appPaleGrey),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: AppIntValues.FIVE),
                              child: Observer(builder: (_) {
                                return ListTile(
                                  onTap: () {
                                    viewmodel.templateIndex = index;
                                  },
                                  iconColor: AppColor.appAmber,
                                  tileColor: AppColor.appGrey,
                                  shape: RoundedRectangleBorder(
                                      side: viewmodel.templateIndex == index
                                          ? const BorderSide(
                                              color: AppColor.appBlue)
                                          : BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(radius)),
                                  leading: const Icon(Icons.flash_auto_rounded),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Light"),
                                      Text("\$108.00")
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: const [
                                      Text(
                                        "MASTERCARD ****3241",
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                );
                              }),
                            );
                          },
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Observer(builder: (_) {
                        return viewmodel.templateIndex == null
                            ? SFElevatedButton(
                                size: const Size(200, 50),
                                childEB: const Text(
                                    AppStrings.CONTINUE_WITHOUT_TEMPLATE,
                                    style: TextStyle(color: AppColor.appBlue)),
                                color: AppColor.appWhite,
                                borderColor: AppColor.appBlue,
                                onPressedEB: () {},
                              )
                            : SFElevatedButton(
                                size: const Size(200, 50),
                                childEB: const Text(AppStrings.CONTINUE,
                                    style: TextStyle(color: AppColor.appWhite)),
                                color: AppColor.appBlue,
                                borderColor: AppColor.appWhite,
                                onPressedEB: () {
                                  Get.toNamed(
                                    AppRoutes.LIGHT_SCREEN,
                                  );
                                },
                              );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



/* class PayWithTemplate {
  final radius = AppIntValues.TEN;
  final viewmodel = locator<SFFloatingActionButtonViewModel>();
  List cards = ["", "", ""];
  getPageViewModel() {
    return PageViewModel(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {},
            ),
            const Text(AppStrings.PAY_WITH_TEMPLATE)
          ]),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: AppColor.appPaleGrey,
            ),
            onPressed: () => Get.back(),
          )
        ],
      ),
      bodyWidget: Column(
        children: [
          Row(
            children: const [
              Text(
                AppStrings.TEMPLATES,
                style: TextStyle(color: AppColor.appPaleGrey),
              ),
            ],
          ),
          SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppIntValues.FIVE),
                    child: Observer(builder: (_) {
                      return ListTile(
                        onTap: () {
                          viewmodel.templateIndex = index;
                        },
                        iconColor: AppColor.appAmber,
                        tileColor: AppColor.appGrey,
                        shape: RoundedRectangleBorder(
                            side: viewmodel.templateIndex == index
                                ? const BorderSide(color: AppColor.appBlue)
                                : BorderSide.none,
                            borderRadius: BorderRadius.circular(radius)),
                        leading: const Icon(Icons.flash_auto_rounded),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Light"),
                            Text("\$108.00")
                          ],
                        ),
                        subtitle: Row(
                          children: const [
                            Text(
                              "MASTERCARD ****3241",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      );
                    }),
                  );
                },
              )),
        ],
      ),
      footer: Row(
        children: [
          Expanded(
            child: Observer(builder: (_) {
              return viewmodel.templateIndex == null
                  ? SFElevatedButton(
                      size: const Size(200, 50),
                      childEB: const Text(AppStrings.CONTINUE_WITHOUT_TEMPLATE,
                          style: TextStyle(color: AppColor.appBlue)),
                      color: AppColor.appWhite,
                      borderColor: AppColor.appBlue,
                      onPressedEB: () {},
                    )
                  : SFElevatedButton(
                      size: const Size(200, 50),
                      childEB: const Text(AppStrings.CONTINUE,
                          style: TextStyle(color: AppColor.appWhite)),
                      color: AppColor.appBlue,
                      borderColor: AppColor.appWhite,
                      onPressedEB: () {
                        Get.toNamed(AppRoutes.LIGHT_SCREEN,);
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }
}
 */
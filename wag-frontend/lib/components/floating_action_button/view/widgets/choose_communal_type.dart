import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_gesture_row.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text.dart';
import 'package:flutter_boilerplate/components/floating_action_button/viewmodel/sf_floating_action_button_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChooseCommunalType extends StatelessWidget {
  ChooseCommunalType({super.key});

  final radius = AppIntValues.TEN;
  final viewmodel = locator<SFFloatingActionButtonViewModel>();
  List cards = [AppStrings.GAS, AppStrings.WATER, AppStrings.LIGHT];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppIntValues.TWENTY),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(text: AppStrings.CHOOSE_COMMUNAL_TYPE),
              SFIconButton(
                iconIconButton: Icons.close,
                onPressedIconButton: () => Get.back(),
              )
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: const [
                        Text(
                          AppStrings.SMART_CARDS,
                          style: TextStyle(color: AppColor.appPaleGrey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cards.length,
                          itemBuilder: (context, index) {
                            return Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(radius)),
                                child: SFGestureRow(
                                  padding:
                                      const EdgeInsets.all(AppIntValues.TEN),
                                  leadingIcon: const Icon(Icons.abc),
                                  title: cards[index],
                                  onTap: () {
                                    viewmodel.controller.animateToPage(
                                        viewmodel.pageIndexPayWithTemplate,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeInOut);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          AppStrings.OTHER,
                          style: TextStyle(color: AppColor.appPaleGrey),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius)),
                      child: SFGestureRow(
                        padding: const EdgeInsets.all(AppIntValues.TEN),
                        leadingIcon: const Icon(Icons.abc),
                        title: AppStrings.INCREASE_BALANCE,
                        onTap: () {
                          viewmodel.index = 1;
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



/* class ChooseCommunalType {
  final radius = AppIntValues.TEN;
  final viewmodel = locator<SFFloatingActionButtonViewModel>();

  List cards = [AppStrings.GAS, AppStrings.WATER, AppStrings.LIGHT, "sgsd"];
  getPageViewModel() {
    return PageViewModel(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SFText(text: AppStrings.CHOOSE_COMMUNAL_TYPE),
            SFIconButton(
              iconIconButton: Icons.close,
              onPressedIconButton: () => Get.back(),
            )
          ],
        ),
        bodyWidget: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: const [
                Text(
                  AppStrings.SMART_CARDS,
                  style: TextStyle(color: AppColor.appPaleGrey),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius)),
                        child: SFGestureRow(
                          padding: const EdgeInsets.all(AppIntValues.TEN),
                          leadingIcon: const Icon(Icons.abc),
                          title: cards[index],
                          onTap: () {
                            viewmodel.index = 1;
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        footer: Column(
          children: [
            Row(
              children: const [
                Text(
                  AppStrings.OTHER,
                  style: TextStyle(color: AppColor.appPaleGrey),
                ),
              ],
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(radius)),
              child: SFGestureRow(
                padding: const EdgeInsets.all(AppIntValues.TEN),
                leadingIcon: const Icon(Icons.abc),
                title: AppStrings.INCREASE_BALANCE,
                onTap: () {
                  viewmodel.index = 1;
                },
              ),
            ),
          ],
        ));
  }
}
 */
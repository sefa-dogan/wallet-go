import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/home/view/widgets/local_generic_smart_cards_list_item.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';

class SmartCardsList extends StatelessWidget {
  const SmartCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: AppIntValues.TWENTY, bottom: AppIntValues.TEN),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
               Text(
                AppStrings.SMART_CARDS,
                style: const TextStyle(color: AppColor.appWhite),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppIntValues.TEN),
            child: Swiper(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppIntValues.TEN))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LocalGenericSmartCardsItem(
                              smallText: "A8716ZJA1",
                              bigText: "LIGHT",
                              bigTextColor: AppColor.appBlack),
                          LocalGenericSmartCardsItem(
                              smallText: "BALANCE",
                              bigText: "13.20",
                              bigTextColor: AppColor.appBlue)
                        ],
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // ignore: prefer_const_constructors
                            Padding(
                              padding: const EdgeInsets.all(AppIntValues.TEN),
                              child: const Icon(
                                  Icons.energy_savings_leaf_outlined),
                            ),
                            LocalGenericSmartCardsItem(
                                smallText: "DEBT",
                                bigText: "0.20",
                                bigTextColor: AppColor.appRed)
                          ])
                    ],
                  ),
                );
              },
              controller: SwiperController(),
              viewportFraction: 0.7,
              scale: 0.7,
            ),
          ),
        ),
      ],
    );
  }
}

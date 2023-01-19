import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/home/view/widgets/local_generic_quick_actions_item.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:get/get.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text(
                  AppStrings.QUICK_ACTIONS,
                  style: TextStyle(color: AppColor.appWhite),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LocalGenericQuickActionsItem(
                    iconContainer: Icons.credit_card,
                    onTapContainer: () {},
                    textContainer: AppStrings.PAY_BILLS),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LocalGenericQuickActionsItem(
                      iconContainer: Icons.credit_card_off,
                      onTapContainer: () {},
                      textContainer: AppStrings.INCREASE_BALANCE),
                ),
                LocalGenericQuickActionsItem(
                    iconContainer: Icons.payment_rounded,
                    onTapContainer: () =>
                        Get.toNamed(AppRoutes.PAYMENTS_SCREEN),
                    textContainer: AppStrings.PAYMENTS_TEMPLATE)
              ],
            )
          ],
        ),
      ],
    );
  }
}

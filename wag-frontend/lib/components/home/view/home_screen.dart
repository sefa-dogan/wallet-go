import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_bottom_app_bar.dart';
import 'package:flutter_boilerplate/components/home/view/widgets/latest_payments_list.dart';
import 'package:flutter_boilerplate/components/home/view/widgets/quick_actions.dart';
import 'package:flutter_boilerplate/components/home/view/widgets/smart_cards_list.dart';
import 'package:flutter_boilerplate/components/home/view/widgets/user_info_bar_list.dart';
import 'package:flutter_boilerplate/components/home/viewmodel/home_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/bottomappbar/sf_bottom_app_bar_store.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final bottomAppBarviewmodel = locator<SFBottomAppBarStore>();

  final viewmodel = locator<HomeViewModel>();

  final userStore = locator<UserStore>();

  @override
  Widget build(BuildContext context) {
    bottomAppBarviewmodel.index = 0;
    // ignore: prefer_const_constructors
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const SizedBox(),
      backgroundColor: AppColor.appWhite,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColor.appBlue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppIntValues.TWENTY),
                      bottomRight: Radius.circular(AppIntValues.TWENTY))),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Expanded(flex: 1, child: UserInfoBar()),
                  const Expanded(flex: 1, child: SmartCardsList()),
                  const Expanded(flex: 1, child: QuickActions())
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: LatestPaymentsList())
        ],
      ),
      bottomNavigationBar: SFBottomAppBar(),
    );
  }
}

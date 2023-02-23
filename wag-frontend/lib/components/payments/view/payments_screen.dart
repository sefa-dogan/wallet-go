import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_bottom_app_bar.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/create_template_form.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_tab_bar.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_tab_bar_view.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/bottomappbar/viewmodel/sf_bottom_app_bar_store.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});
  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen>
    with TickerProviderStateMixin {
  _PaymentsScreenState();

  final bottomAppBarviewmodel = locator<SFBottomAppBarStore>();
  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentsViewModel>();
  final radiusIntValue = AppIntValues.TEN;

  @override
  void initState() {
    // TODO: implement initState
    List<DateTime?>? argument = Get.arguments;
    viewmodel.fromDate = argument?.first;
    viewmodel.toDate = argument?.last;
    argument = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    viewmodel.tabController = TabController(
        length: 2, vsync: this, initialIndex: viewmodel.currentTabIndex);

    bottomAppBarviewmodel.index = 1;
    debugPrint(Get.previousRoute);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: AppColor.appTransparent,
        title: Text(AppStrings.PAYMENTS,
            style: const TextStyle(color: AppColor.appBlack)),
        backgroundColor: AppColor.appWhite,
        bottom: SFTabBar().sfTabBar(),
        actions: [
          Observer(
            builder: (context) {
              return viewmodel.currentTabIndex == 1 &&
                      userStore.templates.isNotEmpty
                  ? SFTextButton(
                      buttonChild: Text(
                        AppStrings.CREATE_NEW,
                        style: const TextStyle(color: AppColor.appBlue),
                      ),
                      onPressedFunc: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CreateTemplateForm();
                          },
                        );
                      },
                    )
                  : const SizedBox();
            },
          ),
        ],
      ),
      backgroundColor: AppColor.appWhite,
      bottomNavigationBar: SFBottomAppBar(),
      floatingActionButton: const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(AppIntValues.TWENTY),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Expanded(child: SFTabBarView())],
        ),
      ),
    );
  }
}

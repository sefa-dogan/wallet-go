import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_boilerplate/components/payments/view/widgets/create_template.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_page_view.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/template_list.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

class SFTabBarView extends StatelessWidget {
  SFTabBarView({super.key});
  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentsViewModel>();
  @override
  Widget build(BuildContext context) {
    viewmodel.tabController!.addListener(() {
      viewmodel.currentTabIndex = viewmodel.tabController!.index;
    });
    return Observer(builder: (_) {
      return TabBarView(
        controller: viewmodel.tabController,
        children: [
          const SFPageView(),
          userStore.templates.isNotEmpty
              ? TemplateList()
              : const CreateTemplate()
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/view/payments_screen.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/create_template.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/template_list.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_page_view.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SFTabBarView extends StatelessWidget {
  SFTabBarView({super.key});
  final userStore = locator<UserStore>();
  final viewmodel=locator<PaymentsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return TabBarView(
        controller: viewmodel.tabController,
        children: [
          SFPageView(),
          userStore.templates.isNotEmpty ? TemplateList() : CreateTemplate()
        ],
      );
    });
  }
}

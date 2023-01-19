import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/template_list.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_page_view.dart';

class SFTabBarView extends StatelessWidget {
  const SFTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [SFPageView(), TemplateList()],
    );
  }
}

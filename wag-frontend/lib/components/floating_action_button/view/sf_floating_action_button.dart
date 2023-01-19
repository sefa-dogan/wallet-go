import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/floating_action_button/view/widgets/choose_communal_type.dart';
import 'package:flutter_boilerplate/components/floating_action_button/view/widgets/pay_with_template.dart';
import 'package:flutter_boilerplate/components/floating_action_button/viewmodel/sf_floating_action_button_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/locator.dart';

class SFFloatingActionButton extends StatelessWidget {
  SFFloatingActionButton({super.key});

  final viewmodel = locator<SFFloatingActionButtonViewModel>();
  @override
  Widget build(BuildContext context) {
    viewmodel.controller = PageController(initialPage: 0);
    return FloatingActionButton(
        backgroundColor: AppColor.appBlue,
        onPressed: () async {
          return showModalBottomSheet(
            backgroundColor: AppColor.appWhite,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppIntValues.TEN))),
            context: context,
            builder: (context) {
              return PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: viewmodel.controller,
                children: [ChooseCommunalType(), PayWithTemplate()],
              );
            },
          );
        },
        child: const Icon(Icons.add));
  }
}

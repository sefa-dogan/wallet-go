import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/add_new_card_form.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/choose_currency_list.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/choose_payment_method_list.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/choose_smart_card_list.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';

import 'what_is_cvv_cvc_code.dart';

class SFPageView extends StatelessWidget {
  SFPageView({super.key});
  final viewmodel = locator<LightViewModel>();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: viewmodel.controller,
      children: [
        ChoosePaymentMethodList(),
        ChooseSmartCardList(),
        ChooseCurrencyList(),
        AddNewCardForm(),
        WhatIsCvvCvcCode()
      ],
    );
  }
}

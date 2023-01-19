import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/components/payment_methods/view/widgets/edit_my_smart_card.dart';
import 'package:flutter_boilerplate/components/payment_methods/view/widgets/my_smart_cards_list.dart';
import 'package:flutter_boilerplate/components/payment_methods/view/widgets/payment_methods_list.dart';
import 'package:flutter_boilerplate/components/payment_methods/viewmodel/payment_methods_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';

class PaymentMethodAndMySmartCards extends StatelessWidget {
  PaymentMethodAndMySmartCards({super.key});
  final viewmodel = locator<PaymentMethodsViewModel>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: viewmodel.controller,
        children: [PaymentMethodsList(), MySmartCardsList(), EditMySmartCard()],
      ),
    );
  }
}

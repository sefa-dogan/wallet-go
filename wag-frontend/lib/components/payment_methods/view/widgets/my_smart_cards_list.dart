import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_gesture_row.dart';
import 'package:flutter_boilerplate/components/payment_methods/viewmodel/payment_methods_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

class MySmartCardsList extends StatelessWidget {
  MySmartCardsList({super.key});

  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentMethodsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: userStore.appAccounts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: SFGestureRow(
                  trailingWidget:
                      Text("\$${userStore.appAccounts[index].balance}"),
                  title: userStore.appAccounts[index].name,
                  onTap: () {
                    viewmodel.selectedAppAccount = userStore.appAccounts[index];
                    viewmodel.controller.animateToPage(2,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  },
                  padding: const EdgeInsets.all(0)),
            );
          },
        ),
      )
    ]);
  }
}

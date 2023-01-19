import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/sf_page_view.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key});

  // ignore: todo
  //TODO paymentTemplateList' e gelen bilgiler viewmodelde ayırıldıktan sonra listelenecek

  // var valuee;

  final radius = AppIntValues.TEN;

  final viewmodel = locator<LightViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (_) {
          return SFTextField(
              title: AppStrings.PAYMENT_METHOD,
              errorText: viewmodel.showPaymentMethodErrorText &&
                      viewmodel.paymentMethodTextFieldText == null
                  ? AppStrings.ERROR_MESSAGE_PAYMENT_METHOD
                  : null,
              readOnly: true,
              autofocus: false,
              controller: TextEditingController(
                  text: viewmodel.paymentMethodTextFieldText),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.appGrey),
                  borderRadius: BorderRadius.circular(radius)),
              hintText: AppStrings.CHOOSE_OR_ADD_NEW,
              hintStyle: const TextStyle(
                color: AppColor.appTextGrey,
              ),
              endIcon: const Icon(Icons.keyboard_arrow_down),
              onChanged: (p0) {},
              keyboardType: TextInputType.text,
              onTap: () {
                viewmodel.showPaymentMethodErrorText = true;
                return showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      viewmodel.controller = PageController(
                          initialPage:
                              viewmodel.pageIndexChoosePaymentMethodList);
                      return SFPageView();
                    });
              });
          /* return SFLocalTextField(
              readOnly: true,
              controllerText: viewmodel.paymentMethodTextFieldText,
              borderColor: AppColor.appTextGrey,
              borderRadius: radius,
              hintText: AppStrings.CHOOSE_OR_ADD_NEW,
              hintTextColor: AppColor.appTextGrey,
              suffixIcon: const Icon(Icons.keyboard_arrow_down),
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    viewmodel.controller = PageController(
                        initialPage:
                            viewmodel.pageIndexChoosePaymentMethodList);
                    return SFPageView();
                  })); */
        })
      ],
    );
  }
}

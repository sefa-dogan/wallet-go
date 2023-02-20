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
class SmartCard extends StatelessWidget {
  SmartCard({super.key});

  final viewmodel = locator<LightViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(
          builder: (context) {
            return SFTextField(
                errorText: viewmodel.showSmartCardErrorText &&
                        viewmodel.selectedAppAccount == null
                    ? AppStrings.ERROR_MESSAGE_SMART_CARD
                    : null,
                title: AppStrings.SMART_CARD,
                readOnly: true,
                enabled:
                    viewmodel.paymentMethodTextFieldText == null ? false : true,
                autofocus: false,
                controller: TextEditingController(
                    text: viewmodel.smartCardTextFieldText),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.appTextGrey),
                    borderRadius: BorderRadius.circular(AppIntValues.TEN)),
                hintText: AppStrings.CHOOSE_YOUR_SMART_CARD,
                hintStyle: const TextStyle(
                  color: AppColor.appTextGrey,
                ),
                endIcon: const Icon(Icons.keyboard_arrow_down),
                onChanged: (p0) {},
                keyboardType: TextInputType.text,
                onTap: () {
                  viewmodel.showSmartCardErrorText = true;
                  return showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      viewmodel.controller = PageController(
                          initialPage: viewmodel.pageIndexChooseSmartCardList);
                      return SFPageView();
                    },
                  );
                });
            /* return SFLocalTextField(
              readOnly: true,
              enabled:
                  viewmodel.paymentMethodTextFieldText == null ? false : true,
              controllerText: viewmodel.smartCardTextFieldText,
              hintText: AppStrings.CHOOSE_YOUR_SMART_CARD,
              borderColor: AppColor.appTextGrey,
              borderRadius: AppIntValues.TEN,
              suffixIcon: const Icon(Icons.keyboard_arrow_down),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) {
                  viewmodel.controller = PageController(
                      initialPage: viewmodel.pageIndexChooseSmartCardList);
                  return SFPageView();
                },
              ),
            ); */
          },
        )
      ],
    );
  }
}

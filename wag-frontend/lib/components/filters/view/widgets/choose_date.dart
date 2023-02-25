import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';
import 'package:flutter_boilerplate/components/filters/view/widgets/calendar.dart';
import 'package:flutter_boilerplate/components/filters/viewmodel/filters_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class ChooseDate extends StatefulWidget {
  const ChooseDate({super.key});

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  final paddingValue = AppIntValues.TEN;

  final radius = AppIntValues.TEN;

  final viewmodel = locator<FiltersViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Text(AppStrings.DATE),
            ],
          ),
        ),
        Observer(
          builder: (context) {
            return TextField(
              readOnly: true,
              controller: TextEditingController(
                  text: viewmodel.fromDate != null
                      ? "${DateFormat("dd/MM/yyyy").format(viewmodel.fromDate!)} - ${viewmodel.toDate != null ? DateFormat("dd/MM/yyyy").format(viewmodel.toDate!) : ""}"
                      : null),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius)),
                hintText: AppStrings.FROM_TO,
                suffixIcon: const Icon(Icons.date_range),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(paddingValue),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.CHOOSE_DATE),
                                SFIconButton(
                                  iconColor: AppColor.appPaleGrey,
                                  iconIconButton: Icons.close,
                                  onPressedIconButton: () {
                                    Get.back();
                                  },
                                )
                              ],
                            ),
                          ),
                          const Calendar()
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}

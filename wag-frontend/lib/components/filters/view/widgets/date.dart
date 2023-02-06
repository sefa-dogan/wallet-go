import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';
import 'package:flutter_boilerplate/components/filters/view/widgets/calendar.dart';
import 'package:flutter_boilerplate/components/filters/viewmodel/filters_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class Date extends StatefulWidget {
  const Date({super.key});

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  final paddingValue = AppIntValues.TEN;
  final radius = AppIntValues.TEN;
  final viewmodel = locator<FiltersViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text("Date"),
          ],
        ),
        Observer(
          builder: (context) {
            return TextField(
              readOnly: false,
              controller: TextEditingController(
                  text: viewmodel.fromDate != null
                      ? "${viewmodel.fromDate} - ${viewmodel.toDate ?? ""}"
                      : null),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius)),
                hintText: AppStrings.FROM_TO,
                suffixIcon: const Icon(Icons.date_range),
              ),
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(radius),
                  )),
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
                          Calendar()
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

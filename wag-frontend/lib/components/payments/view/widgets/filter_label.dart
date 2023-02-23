import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilterLabel extends StatelessWidget {
  FilterLabel({super.key});
  final viewmodel = locator<PaymentsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Color.fromARGB(255, 219, 235, 248)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${DateFormat("dd/MM/yy").format(viewmodel.fromDate!)} - ${DateFormat("dd/MM/yy").format(viewmodel.toDate!)}",
            style: const TextStyle(color: AppColor.appBlue),
          ),
          IconButton(
            onPressed: () {
              viewmodel.fromDate = null;
              viewmodel.toDate = null;
            },
            icon: Icon(
              Icons.close,
              color: AppColor.appBlue,
            ),
          )
        ],
      ),
    );
  }
}

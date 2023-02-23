import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';

// ignore: must_be_immutable
class SFDropdownButtonFormField extends StatefulWidget {
  //@sdfgsdgsd
  SFDropdownButtonFormField(
      {super.key,
      required this.title,
      required this.items,
      required this.hint});
  String title;
  Widget hint;
  List<Map<Widget, dynamic>> items;

  @override
  State<SFDropdownButtonFormField> createState() =>
      _SFDropdownButtonFormFieldState();
}

class _SFDropdownButtonFormFieldState extends State<SFDropdownButtonFormField> {
  final viewmodel = locator<PaymentsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: AppIntValues.FIVE),
          child: Row(
            children: [Text(widget.title)],
          ),
        ),
        DropdownButtonFormField(
          hint: widget.hint,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN))),
          borderRadius: BorderRadius.circular(AppIntValues.TWENTY),
          // value: viewmodel.selectedAppAccountForTemplate,
          items: widget.items
              .map((e) => DropdownMenuItem(
                    value: e.values.first,
                    child: e.keys.first,
                  ))
              .toList(),
          onChanged: (value) {
            viewmodel.selectedAppAccountForTemplate = value as AppAccount;
            debugPrint(viewmodel.selectedAppAccountForTemplate.toString());
            setState(() {});
          },
        )
      ],
    );
  }
}

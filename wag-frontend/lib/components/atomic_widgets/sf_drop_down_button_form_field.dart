import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';

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
  // ignore: prefer_typing_uninitialized_variables
  var dValue;
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
          value: dValue,
          items: widget.items
              .map((e) => DropdownMenuItem(
                    value: e.values.first,
                    child: e.keys.first,
                  ))
              .toList(),
          onChanged: (value) {
            dValue = value;
            setState(() {});
          },
        )
      ],
    );
  }
}

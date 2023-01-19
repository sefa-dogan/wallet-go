import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';

// ignore: must_be_immutable
class LocalGenericSmartCardsItem extends StatelessWidget {
  LocalGenericSmartCardsItem(
      {super.key,
      required this.smallText,
      required this.bigText,
      required this.bigTextColor});

  String smallText;
  String bigText;
  Color bigTextColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppIntValues.TEN),
      child: Column(
        children: [
          Text(smallText,
              style: const TextStyle(
                fontSize: AppIntValues.TEN,
              )),
          Text(
            bigText,
            style:
                TextStyle(fontSize: AppIntValues.TWENTY, color: bigTextColor),
          )
        ],
      ),
    );
  }
}

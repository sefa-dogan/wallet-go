import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class LocalGenericPageViewModel {
  getPageViewModel({required String imageTitle}) {
    return PageViewModel(
        title: "",
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageTitle), fit: BoxFit.fill),
          ),
        ),
        body: "");
  }
}

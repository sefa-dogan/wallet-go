import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'sf_floating_action_button_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class SFFloatingActionButtonViewModel = _SFFloatingActionButtonViewModelBase
    with _$SFFloatingActionButtonViewModel;

abstract class _SFFloatingActionButtonViewModelBase with Store {
  int pageIndexChooseCommunalType = 0;
  int pageIndexPayWithTemplate = 1;

  @observable
  int index = 0;
  @observable
  int? templateIndex;

  late PageController controller;
}

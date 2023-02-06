import 'package:mobx/mobx.dart';
part 'sf_bottom_app_bar_store.g.dart';

// ignore: library_private_types_in_public_api
class SFBottomAppBarStore = _SFBottomAppBarStoreBase with _$SFBottomAppBarStore;

abstract class _SFBottomAppBarStoreBase with Store {
  @observable
  int index = 0;
}

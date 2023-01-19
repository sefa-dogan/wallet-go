import 'package:mobx/mobx.dart';
part 'notifications_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class NotificationsViewModel = _NotificationsViewModelBase
    with _$NotificationsViewModel;

abstract class _NotificationsViewModelBase with Store {
  @observable
  int? selectedItemIndex;
}

import 'package:mobx/mobx.dart';
part 'filters_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class FiltersViewModel = _FiltersViewModelBase with _$FiltersViewModel;

abstract class _FiltersViewModelBase with Store {
  @observable
  DateTime? fromDate;
  @observable
  DateTime? toDate;
}

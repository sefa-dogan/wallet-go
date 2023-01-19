import 'package:mobx/mobx.dart';
part 'forgot_password_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store {
  String email="";
}

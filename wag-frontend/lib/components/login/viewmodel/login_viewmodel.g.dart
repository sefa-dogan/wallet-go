// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$usernameAtom =
      Atom(name: '_LoginViewModelBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginViewModelBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$hidePasswordAtom =
      Atom(name: '_LoginViewModelBase.hidePassword', context: context);

  @override
  bool get hidePassword {
    _$hidePasswordAtom.reportRead();
    return super.hidePassword;
  }

  @override
  set hidePassword(bool value) {
    _$hidePasswordAtom.reportWrite(value, super.hidePassword, () {
      super.hidePassword = value;
    });
  }

  late final _$showErrorMessagePasswordAtom = Atom(
      name: '_LoginViewModelBase.showErrorMessagePassword', context: context);

  @override
  bool get showErrorMessagePassword {
    _$showErrorMessagePasswordAtom.reportRead();
    return super.showErrorMessagePassword;
  }

  @override
  set showErrorMessagePassword(bool value) {
    _$showErrorMessagePasswordAtom
        .reportWrite(value, super.showErrorMessagePassword, () {
      super.showErrorMessagePassword = value;
    });
  }

  late final _$showErrorMessageUsernameAtom = Atom(
      name: '_LoginViewModelBase.showErrorMessageUsername', context: context);

  @override
  bool get showErrorMessageUsername {
    _$showErrorMessageUsernameAtom.reportRead();
    return super.showErrorMessageUsername;
  }

  @override
  set showErrorMessageUsername(bool value) {
    _$showErrorMessageUsernameAtom
        .reportWrite(value, super.showErrorMessageUsername, () {
      super.showErrorMessageUsername = value;
    });
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  dynamic setUsername(String value) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
password: ${password},
hidePassword: ${hidePassword},
showErrorMessagePassword: ${showErrorMessagePassword},
showErrorMessageUsername: ${showErrorMessageUsername}
    ''';
  }
}

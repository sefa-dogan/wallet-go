// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  late final _$usernameAtom =
      Atom(name: '_RegisterViewModelBase.username', context: context);

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

  late final _$nameAtom =
      Atom(name: '_RegisterViewModelBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$surnameAtom =
      Atom(name: '_RegisterViewModelBase.surname', context: context);

  @override
  String get surname {
    _$surnameAtom.reportRead();
    return super.surname;
  }

  @override
  set surname(String value) {
    _$surnameAtom.reportWrite(value, super.surname, () {
      super.surname = value;
    });
  }

  late final _$tcnoAtom =
      Atom(name: '_RegisterViewModelBase.tcno', context: context);

  @override
  String get tcno {
    _$tcnoAtom.reportRead();
    return super.tcno;
  }

  @override
  set tcno(String value) {
    _$tcnoAtom.reportWrite(value, super.tcno, () {
      super.tcno = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_RegisterViewModelBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterViewModelBase.password', context: context);

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

  late final _$showErrorMessageUsernameAtom = Atom(
      name: '_RegisterViewModelBase.showErrorMessageUsername',
      context: context);

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

  late final _$showErrorMessageNameAtom = Atom(
      name: '_RegisterViewModelBase.showErrorMessageName', context: context);

  @override
  bool get showErrorMessageName {
    _$showErrorMessageNameAtom.reportRead();
    return super.showErrorMessageName;
  }

  @override
  set showErrorMessageName(bool value) {
    _$showErrorMessageNameAtom.reportWrite(value, super.showErrorMessageName,
        () {
      super.showErrorMessageName = value;
    });
  }

  late final _$showErrorMessageSurnameAtom = Atom(
      name: '_RegisterViewModelBase.showErrorMessageSurname', context: context);

  @override
  bool get showErrorMessageSurname {
    _$showErrorMessageSurnameAtom.reportRead();
    return super.showErrorMessageSurname;
  }

  @override
  set showErrorMessageSurname(bool value) {
    _$showErrorMessageSurnameAtom
        .reportWrite(value, super.showErrorMessageSurname, () {
      super.showErrorMessageSurname = value;
    });
  }

  late final _$showErrorMessageTcNoAtom = Atom(
      name: '_RegisterViewModelBase.showErrorMessageTcNo', context: context);

  @override
  bool get showErrorMessageTcNo {
    _$showErrorMessageTcNoAtom.reportRead();
    return super.showErrorMessageTcNo;
  }

  @override
  set showErrorMessageTcNo(bool value) {
    _$showErrorMessageTcNoAtom.reportWrite(value, super.showErrorMessageTcNo,
        () {
      super.showErrorMessageTcNo = value;
    });
  }

  late final _$showErrorMessageEmailAtom = Atom(
      name: '_RegisterViewModelBase.showErrorMessageEmail', context: context);

  @override
  bool get showErrorMessageEmail {
    _$showErrorMessageEmailAtom.reportRead();
    return super.showErrorMessageEmail;
  }

  @override
  set showErrorMessageEmail(bool value) {
    _$showErrorMessageEmailAtom.reportWrite(value, super.showErrorMessageEmail,
        () {
      super.showErrorMessageEmail = value;
    });
  }

  late final _$showErrorMessagePasswordAtom = Atom(
      name: '_RegisterViewModelBase.showErrorMessagePassword',
      context: context);

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

  late final _$hidePasswordAtom =
      Atom(name: '_RegisterViewModelBase.hidePassword', context: context);

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

  late final _$inProgressAtom =
      Atom(name: '_RegisterViewModelBase.inProgress', context: context);

  @override
  bool get inProgress {
    _$inProgressAtom.reportRead();
    return super.inProgress;
  }

  @override
  set inProgress(bool value) {
    _$inProgressAtom.reportWrite(value, super.inProgress, () {
      super.inProgress = value;
    });
  }

  late final _$getAppUsersAsyncAction =
      AsyncAction('_RegisterViewModelBase.getAppUsers', context: context);

  @override
  Future<dynamic> getAppUsers() {
    return _$getAppUsersAsyncAction.run(() => super.getAppUsers());
  }

  late final _$postAppUserAsyncAction =
      AsyncAction('_RegisterViewModelBase.postAppUser', context: context);

  @override
  Future<dynamic> postAppUser() {
    return _$postAppUserAsyncAction.run(() => super.postAppUser());
  }

  late final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase', context: context);

  @override
  dynamic setUsername(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSurname(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setSurname');
    try {
      return super.setSurname(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTcNo(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setTcNo');
    try {
      return super.setTcNo(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
name: ${name},
surname: ${surname},
tcno: ${tcno},
email: ${email},
password: ${password},
showErrorMessageUsername: ${showErrorMessageUsername},
showErrorMessageName: ${showErrorMessageName},
showErrorMessageSurname: ${showErrorMessageSurname},
showErrorMessageTcNo: ${showErrorMessageTcNo},
showErrorMessageEmail: ${showErrorMessageEmail},
showErrorMessagePassword: ${showErrorMessagePassword},
hidePassword: ${hidePassword},
inProgress: ${inProgress}
    ''';
  }
}

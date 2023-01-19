// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_details_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PersonalDetailsViewModel on _PersonalDetailsViewModelBase, Store {
  late final _$nameAndSurnameAtom = Atom(
      name: '_PersonalDetailsViewModelBase.nameAndSurname', context: context);

  @override
  String get nameAndSurname {
    _$nameAndSurnameAtom.reportRead();
    return super.nameAndSurname;
  }

  @override
  set nameAndSurname(String value) {
    _$nameAndSurnameAtom.reportWrite(value, super.nameAndSurname, () {
      super.nameAndSurname = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_PersonalDetailsViewModelBase.email', context: context);

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

  late final _$tcnoAtom =
      Atom(name: '_PersonalDetailsViewModelBase.tcno', context: context);

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

  late final _$isEditingAtom =
      Atom(name: '_PersonalDetailsViewModelBase.isEditing', context: context);

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  late final _$showErrorMessageTcNoAtom = Atom(
      name: '_PersonalDetailsViewModelBase.showErrorMessageTcNo',
      context: context);

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
      name: '_PersonalDetailsViewModelBase.showErrorMessageEmail',
      context: context);

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

  late final _$showErrorMessageNameAndSurnameAtom = Atom(
      name: '_PersonalDetailsViewModelBase.showErrorMessageNameAndSurname',
      context: context);

  @override
  bool get showErrorMessageNameAndSurname {
    _$showErrorMessageNameAndSurnameAtom.reportRead();
    return super.showErrorMessageNameAndSurname;
  }

  @override
  set showErrorMessageNameAndSurname(bool value) {
    _$showErrorMessageNameAndSurnameAtom
        .reportWrite(value, super.showErrorMessageNameAndSurname, () {
      super.showErrorMessageNameAndSurname = value;
    });
  }

  late final _$_PersonalDetailsViewModelBaseActionController =
      ActionController(name: '_PersonalDetailsViewModelBase', context: context);

  @override
  dynamic isPressedEdit() {
    final _$actionInfo = _$_PersonalDetailsViewModelBaseActionController
        .startAction(name: '_PersonalDetailsViewModelBase.isPressedEdit');
    try {
      return super.isPressedEdit();
    } finally {
      _$_PersonalDetailsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameAndSurname: ${nameAndSurname},
email: ${email},
tcno: ${tcno},
isEditing: ${isEditing},
showErrorMessageTcNo: ${showErrorMessageTcNo},
showErrorMessageEmail: ${showErrorMessageEmail},
showErrorMessageNameAndSurname: ${showErrorMessageNameAndSurname}
    ''';
  }
}

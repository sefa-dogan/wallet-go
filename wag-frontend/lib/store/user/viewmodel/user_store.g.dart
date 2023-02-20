// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStoreBase, Store {
  late final _$templatesAtom =
      Atom(name: '_UserStoreBase.templates', context: context);

  @override
  List<Template> get templates {
    _$templatesAtom.reportRead();
    return super.templates;
  }

  @override
  set templates(List<Template> value) {
    _$templatesAtom.reportWrite(value, super.templates, () {
      super.templates = value;
    });
  }

  late final _$getTemplatesAsyncAction =
      AsyncAction('_UserStoreBase.getTemplates', context: context);

  @override
  Future<dynamic> getTemplates() {
    return _$getTemplatesAsyncAction.run(() => super.getTemplates());
  }

  @override
  String toString() {
    return '''
templates: ${templates}
    ''';
  }
}

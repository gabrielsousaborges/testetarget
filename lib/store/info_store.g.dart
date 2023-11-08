// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfoStore on _InfoStoreBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_InfoStoreBase.isFormValid'))
          .value;

  late final _$newinfoAtom =
      Atom(name: '_InfoStoreBase.newinfo', context: context);

  @override
  String get newinfo {
    _$newinfoAtom.reportRead();
    return super.newinfo;
  }

  @override
  set newinfo(String value) {
    _$newinfoAtom.reportWrite(value, super.newinfo, () {
      super.newinfo = value;
    });
  }

  late final _$listInfoAtom =
      Atom(name: '_InfoStoreBase.listInfo', context: context);

  @override
  List<dynamic> get listInfo {
    _$listInfoAtom.reportRead();
    return super.listInfo;
  }

  @override
  set listInfo(List<dynamic> value) {
    _$listInfoAtom.reportWrite(value, super.listInfo, () {
      super.listInfo = value;
    });
  }

  late final _$datainfoAtom =
      Atom(name: '_InfoStoreBase.datainfo', context: context);

  @override
  List<dynamic> get datainfo {
    _$datainfoAtom.reportRead();
    return super.datainfo;
  }

  @override
  set datainfo(List<dynamic> value) {
    _$datainfoAtom.reportWrite(value, super.datainfo, () {
      super.datainfo = value;
    });
  }

  late final _$addInfoListAsyncAction =
      AsyncAction('_InfoStoreBase.addInfoList', context: context);

  @override
  Future<void> addInfoList(List<dynamic> infoList) {
    return _$addInfoListAsyncAction.run(() => super.addInfoList(infoList));
  }

  late final _$findListInfoAsyncAction =
      AsyncAction('_InfoStoreBase.findListInfo', context: context);

  @override
  Future findListInfo() {
    return _$findListInfoAsyncAction.run(() => super.findListInfo());
  }

  late final _$_InfoStoreBaseActionController =
      ActionController(name: '_InfoStoreBase', context: context);

  @override
  void addList() {
    final _$actionInfo = _$_InfoStoreBaseActionController.startAction(
        name: '_InfoStoreBase.addList');
    try {
      return super.addList();
    } finally {
      _$_InfoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeList(String value) {
    final _$actionInfo = _$_InfoStoreBaseActionController.startAction(
        name: '_InfoStoreBase.removeList');
    try {
      return super.removeList(value);
    } finally {
      _$_InfoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewInfo(String value) {
    final _$actionInfo = _$_InfoStoreBaseActionController.startAction(
        name: '_InfoStoreBase.setNewInfo');
    try {
      return super.setNewInfo(value);
    } finally {
      _$_InfoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizaLista(List<dynamic> value) {
    final _$actionInfo = _$_InfoStoreBaseActionController.startAction(
        name: '_InfoStoreBase.atualizaLista');
    try {
      return super.atualizaLista(value);
    } finally {
      _$_InfoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newinfo: ${newinfo},
listInfo: ${listInfo},
datainfo: ${datainfo},
isFormValid: ${isFormValid}
    ''';
  }
}

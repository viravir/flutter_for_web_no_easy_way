// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RootDataStore on RootDataStoreBase, Store {
  final _$camerasAtom = Atom(name: 'RootDataStoreBase.cameras');

  @override
  Cameras get cameras {
    _$camerasAtom.reportRead();
    return super.cameras;
  }

  @override
  set cameras(Cameras value) {
    _$camerasAtom.reportWrite(value, super.cameras, () {
      super.cameras = value;
    });
  }

  final _$RootDataStoreBaseActionController =
      ActionController(name: 'RootDataStoreBase');

  @override
  void dispose() {
    final _$actionInfo = _$RootDataStoreBaseActionController.startAction(
        name: 'RootDataStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$RootDataStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cameras: ${cameras}
    ''';
  }
}

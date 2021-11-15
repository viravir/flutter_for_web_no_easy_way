// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cameras_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cameras on CamerasData, Store {
  final _$camerasAtom = Atom(name: 'CamerasData.cameras');

  @override
  ObservableList<CameraModel> get cameras {
    _$camerasAtom.reportRead();
    return super.cameras;
  }

  @override
  set cameras(ObservableList<CameraModel> value) {
    _$camerasAtom.reportWrite(value, super.cameras, () {
      super.cameras = value;
    });
  }

  final _$getCamerasAsyncAction = AsyncAction('CamerasData.getCameras');

  @override
  Future<void> getCameras() {
    return _$getCamerasAsyncAction.run(() => super.getCameras());
  }

  final _$CamerasDataActionController = ActionController(name: 'CamerasData');

  @override
  void _setCameras(List<CameraModel> cameras) {
    final _$actionInfo = _$CamerasDataActionController.startAction(
        name: 'CamerasData._setCameras');
    try {
      return super._setCameras(cameras);
    } finally {
      _$CamerasDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCamera(CameraModel camera) {
    final _$actionInfo = _$CamerasDataActionController.startAction(
        name: 'CamerasData.addCamera');
    try {
      return super.addCamera(camera);
    } finally {
      _$CamerasDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCamera(CameraModel camera) {
    final _$actionInfo = _$CamerasDataActionController.startAction(
        name: 'CamerasData.removeCamera');
    try {
      return super.removeCamera(camera);
    } finally {
      _$CamerasDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo =
        _$CamerasDataActionController.startAction(name: 'CamerasData.dispose');
    try {
      return super.dispose();
    } finally {
      _$CamerasDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cameras: ${cameras}
    ''';
  }
}

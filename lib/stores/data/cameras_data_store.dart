import 'package:flutter_for_web_no_easy_way/models/camera.dart';
import 'package:flutter_for_web_no_easy_way/repositories/camera_repository.dart';
import 'package:mobx/mobx.dart';

part 'cameras_data_store.g.dart';

class Cameras = CamerasData with _$Cameras;

abstract class CamerasData with Store {
  final CameraRepository _cameraRepository;

  CamerasData(this._cameraRepository);

  @observable
  ObservableList<CameraModel> cameras = ObservableList();

  @action
  Future<void> getCameras() async {
    final fetchedCameras = await _cameraRepository.getCameras();
    _setCameras(fetchedCameras);
  }

  @action
  void _setCameras(List<CameraModel> cameras) {
    this.cameras = ObservableList.of(cameras);
  }

  @action
  void addCamera(CameraModel camera) {
    cameras.add(camera);
  }

  @action
  void removeCamera(CameraModel camera) {
    cameras.remove(camera);
  }

  @action
  void dispose() {
    cameras = ObservableList();
  }
}

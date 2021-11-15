import 'package:flutter_for_web_no_easy_way/repositories/camera_repository.dart';
import 'package:flutter_for_web_no_easy_way/stores/data/cameras_data_store.dart';
import 'package:mobx/mobx.dart';

part 'root_data_store.g.dart';

class RootDataStore = RootDataStoreBase with _$RootDataStore;

abstract class RootDataStoreBase with Store {
  RootDataStoreBase(CameraRepository cameraRepository)
      : cameras = Cameras(cameraRepository);

  @observable
  Cameras cameras;

  @action
  void dispose() {
    cameras.dispose();
  }
}

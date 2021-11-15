import 'package:flutter/material.dart';
import 'package:flutter_for_web_no_easy_way/models/camera.dart';
import 'package:flutter_for_web_no_easy_way/repositories/player_repository.dart';
import 'package:flutter_for_web_no_easy_way/stores/root_data_store.dart';
import 'package:mobx/mobx.dart';

part 'cameras_screen_vm.g.dart';

class CamerasScreenVM = CamerasScreenVMBase with _$CamerasScreenVM;

abstract class CamerasScreenVMBase with Store {
  final RootDataStore _rootDataStore;
  final PlayerRepository _playerRepository;

  CamerasScreenVMBase(this._rootDataStore, this._playerRepository);

  ObservableList<CameraModel> get cameras => _rootDataStore.cameras.cameras;

  @action
  Future<void> getCameras() {
    return _rootDataStore.cameras.getCameras();
  }

  Future<void> initPlayers() {
    return Future.wait(
        cameras.map((camera) => _playerRepository.initPlayer(camera.id)));
  }

  Future<void> playMultiple() {
    return Future.wait(
        cameras.map((camera) => _playerRepository.play(camera.id)));
  }

  Future<void> pauseMultiple() {
    return Future.wait(
        cameras.map((camera) => _playerRepository.pause(camera.id)));
  }

  Future<void> disposePlayers() {
    return Future.wait(
        cameras.map((camera) => _playerRepository.disposePlayer(camera.id)));
  }

  Widget renderPlayer(CameraModel camera) {
    return _playerRepository.renderVideoPlayer(camera.id);
  }

  Future<void> dispose() {
    return Future.wait(
        cameras.map((camera) => _playerRepository.disposePlayer(camera.id)));
  }
}

import 'package:flutter_for_web_no_easy_way/models/camera.dart';
import 'package:flutter_for_web_no_easy_way/repositories/camera_repository.dart';
import 'package:flutter_for_web_no_easy_way/services/camera_service.dart';

class CameraRepositoryImpl implements CameraRepository {
  final CameraService _cameraService;

  const CameraRepositoryImpl(this._cameraService);

  @override
  Future<List<CameraModel>> getCameras() {
    return _cameraService.getCameras();
  }
}

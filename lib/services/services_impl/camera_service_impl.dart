import 'package:flutter_for_web_no_easy_way/models/camera.dart';
import 'package:flutter_for_web_no_easy_way/services/camera_service.dart';

const mockCamerasCount = 15;

class CameraServiceImpl implements CameraService {
  @override
  Future<List<CameraModel>> getCameras() async {
    final cameraList = List.generate(
        mockCamerasCount,
        (int index) => CameraModel.fromJson(
            {'id': 'videoPlayer-$index', 'name': 'Camera-${index + 1}'}));
    return cameraList;
  }
}

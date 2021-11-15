import 'package:flutter_for_web_no_easy_way/models/camera.dart';

abstract class CameraService {
  Future<List<CameraModel>> getCameras();
}

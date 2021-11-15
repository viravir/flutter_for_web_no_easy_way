import 'package:flutter_for_web_no_easy_way/repositories/camera_repository.dart';
import 'package:flutter_for_web_no_easy_way/repositories/player_repository.dart';
import 'package:flutter_for_web_no_easy_way/repositories/repositories_impl/camera_repository_impl.dart';
import 'package:flutter_for_web_no_easy_way/repositories/repositories_impl/player_repository_impl.dart';
import 'package:flutter_for_web_no_easy_way/services/camera_service.dart';
import 'package:flutter_for_web_no_easy_way/services/player_service.dart';
import 'package:flutter_for_web_no_easy_way/services/services_impl/camera_service_impl.dart';
import 'package:flutter_for_web_no_easy_way/services/services_impl/player_service_impl.dart';
import 'package:flutter_for_web_no_easy_way/stores/root_data_store.dart';
import 'package:flutter_for_web_no_easy_way/view_models/cameras_screen_vm.dart';
import 'package:get_it/get_it.dart';

class Locator {
  static Future<void> init() {
    final GetIt getIt = Locator.instance;

    // #region Services
    getIt.registerSingleton<CameraService>(CameraServiceImpl());
    getIt.registerSingleton<PlayerService>(PlayerServiceImpl());
    // #endregion

    // #region Repositories
    getIt
        .registerSingleton<CameraRepository>(CameraRepositoryImpl(getIt.get()));
    getIt
        .registerSingleton<PlayerRepository>(PlayerRepositoryImpl(getIt.get()));
    // #endregion

    // #region Data stores
    getIt.registerSingleton<RootDataStore>(RootDataStore(getIt.get()));
    // #endregion

    // #region Domain stores/View models
    getIt.registerFactory<CamerasScreenVM>(
        () => CamerasScreenVM(getIt.get(), getIt.get()));
    // #endregion

    return getIt.allReady();
  }

  static get instance {
    return GetIt.I;
  }
}

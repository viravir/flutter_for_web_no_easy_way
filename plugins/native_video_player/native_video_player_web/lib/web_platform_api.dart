@JS('NativeVideoPlayerPlugin')
library web_platform_api;

import 'package:js/js.dart';

@JS('init')
external Future<void> init(String playerId);

@JS('dispose')
external Future<void> dispose(String playerId);

@JS('play')
external Future<void> play(String playerId);

@JS('pause')
external Future<void> pause(String playerId);

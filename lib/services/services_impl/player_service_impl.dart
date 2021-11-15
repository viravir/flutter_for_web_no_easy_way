import 'package:flutter/material.dart';
import 'package:flutter_for_web_no_easy_way/services/player_service.dart';
import 'package:native_video_player/native_video_player.dart';

class PlayerServiceImpl implements PlayerService {
  final NativeVideoPlayerPlatform _nativeVideoPlayerPlatform =
      NativeVideoPlayerPlatform.instance;

  @override
  Future<int> initPlayer(String playerId) {
    return _nativeVideoPlayerPlatform.init(playerId);
  }

  @override
  Future<void> disposePlayer(String playerId) {
    return _nativeVideoPlayerPlatform.dispose(playerId);
  }

  @override
  Future<void> play(String playerId) {
    return _nativeVideoPlayerPlatform.play(playerId);
  }

  @override
  Future<void> pause(String playerId) {
    return _nativeVideoPlayerPlatform.pause(playerId);
  }

  @override
  Widget renderVideoPlayer(String playerId) {
    return _nativeVideoPlayerPlatform.renderVideoPlayer(playerId);
  }
}

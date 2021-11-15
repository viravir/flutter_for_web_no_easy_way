import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_video_player_platform_interface/ui/native_video_player_mobile.dart';

import 'native_video_player_platform_interface.dart';

const MethodChannel _channel =
    MethodChannel('example/plugins/method/native_video_player');

/// An implementation of [NativeVideoPlayerPlatform] that uses method channels.
class MethodChannelNativeVideoPlayer extends NativeVideoPlayerPlatform {
  int textureIdCounter = 0;

  @override
  Future<int> init(String playerId) async {
    final textureId = await _channel.invokeMethod<int>(
      'init',
      <String, Object>{
        'playerId': playerId,
      },
    );
    if (textureId == null) {
      throw PlatformException(code: '500', message: 'Unable to create Texture');
    }

    return textureId;
  }

  @override
  Future<void> dispose(String playerId) {
    return _channel.invokeMethod(
      'dispose',
      {
        'playerId': playerId,
      },
    );
  }

  @override
  Future<void> play(String playerId) {
    return _channel.invokeMethod(
      'play',
      {
        'playerId': playerId,
      },
    );
  }

  @override
  Future<void> pause(String playerId) {
    return _channel.invokeMethod(
      'pause',
      {
        'playerId': playerId,
      },
    );
  }

  @override
  Widget renderVideoPlayer(String playerId) {
    final textureId = textureIdCounter++;
    return NativeVideoPlayerMobile(playerId, textureId);
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_native_video_player.dart';

abstract class NativeVideoPlayerPlatform extends PlatformInterface {
  NativeVideoPlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeVideoPlayerPlatform _instance = MethodChannelNativeVideoPlayer();

  /// The default instance of [NativeVideoPlayerPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeVideoPlayer].
  static NativeVideoPlayerPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UrlLauncherPlatform] when they register themselves.
  static set instance(NativeVideoPlayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int> init(String playerId) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<void> dispose(String playerId) {
    throw UnimplementedError('dispose() has not been implemented.');
  }

  Future<void> play(String playerId) {
    throw UnimplementedError('play() has not been implemented.');
  }

  Future<void> pause(String playerId) {
    throw UnimplementedError('pause() has not been implemented.');
  }

  Widget renderVideoPlayer(String playerId) {
    throw UnimplementedError('renderVideoPlayer() has not been implemented.');
  }
}

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:native_video_player_platform_interface/native_video_player_platform_interface.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:native_video_player_web/ui/native_video_player_web.dart';
import 'package:native_video_player_web/web_platform_api.dart'
    as web_platform_api;

/// The web implementation of [NativeVideoPlayerPlatform].
class NativeVideoPlayer extends NativeVideoPlayerPlatform {
  int textureIdCounter = 0;

  /// Registers this class as the default instance of [NativeVideoPlayerPlatform].
  static void registerWith(Registrar registrar) {
    NativeVideoPlayerPlatform.instance = NativeVideoPlayer();
  }

  @override
  Future<int> init(String playerId) async {
    await web_platform_api.init(playerId);
    // We are using platform view for a player, so by the moment this method executes, view might not be created yet
    return 0;
  }

  @override
  Future<void> dispose(String playerId) async {
    await web_platform_api.dispose(playerId);
  }

  @override
  Future<void> play(String playerId) async {
    await web_platform_api.play(playerId);
  }

  @override
  Future<void> pause(String playerId) async {
    await web_platform_api.pause(playerId);
  }

  @override
  Widget renderVideoPlayer(String playerId) {
    final textureId = textureIdCounter++;
    return NativeVideoPlayerWeb(playerId, textureId);
  }
}

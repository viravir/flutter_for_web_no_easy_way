import 'package:flutter/material.dart';

abstract class PlayerRepository {
  Future<int> initPlayer(String playerId);
  Future<void> disposePlayer(String playerId);
  Future<void> play(String playerId);
  Future<void> pause(String playerId);
  Widget renderVideoPlayer(String playerId);
}

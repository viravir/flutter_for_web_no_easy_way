import 'package:flutter/material.dart';
import 'package:flutter_for_web_no_easy_way/repositories/player_repository.dart';
import 'package:flutter_for_web_no_easy_way/services/player_service.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerService _playerService;

  const PlayerRepositoryImpl(this._playerService);

  @override
  Future<int> initPlayer(String playerId) {
    return _playerService.initPlayer(playerId);
  }

  @override
  Future<void> disposePlayer(String playerId) {
    return _playerService.disposePlayer(playerId);
  }

  @override
  Future<void> play(String playerId) {
    return _playerService.play(playerId);
  }

  @override
  Future<void> pause(String playerId) {
    return _playerService.pause(playerId);
  }

  @override
  Widget renderVideoPlayer(String playerId) {
    return _playerService.renderVideoPlayer(playerId);
  }
}

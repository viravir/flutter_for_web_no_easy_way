import 'dart:html';

import 'package:flutter/material.dart';
import 'package:native_video_player_web/shims/dart_ui.dart' as ui;

class NativeVideoPlayerWeb extends StatefulWidget {
  final String playerId;
  final int textureId;

  NativeVideoPlayerWeb(this.playerId, this.textureId, {Key? key})
      : super(key: key);

  @override
  State<NativeVideoPlayerWeb> createState() => _NativeVideoPlayerWebState();
}

class _NativeVideoPlayerWebState extends State<NativeVideoPlayerWeb> {
  late final VideoElement videoElement;

  @override
  void initState() {
    videoElement = VideoElement()
      ..id = widget.playerId
      ..autoplay = false
      ..controls = false;

    ui.platformViewRegistry.registerViewFactory(
        'videoPlayer-${widget.textureId}', (int viewId) => videoElement);
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: 'videoPlayer-${widget.textureId}',
    );
  }
}

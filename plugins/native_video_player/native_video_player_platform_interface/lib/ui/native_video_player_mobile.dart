import 'package:flutter/material.dart';

class NativeVideoPlayerMobile extends StatelessWidget {
  final String playerId;
  final int textureId;

  NativeVideoPlayerMobile(this.playerId, this.textureId, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Texture(textureId: textureId);
  }
}

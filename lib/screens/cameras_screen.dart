import 'package:flutter/material.dart';
import 'package:flutter_for_web_no_easy_way/configs/custom_icons.dart';
import 'package:flutter_for_web_no_easy_way/di/locator.dart' as di;
import 'package:flutter_for_web_no_easy_way/view_models/cameras_screen_vm.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class CamerasScreen extends StatefulWidget {
  const CamerasScreen({Key? key}) : super(key: key);

  @override
  State<CamerasScreen> createState() => _CamerasScreenState();
}

class _CamerasScreenState extends State<CamerasScreen> {
  final CamerasScreenVM vm = di.Locator.instance.get<CamerasScreenVM>();

  late ReactionDisposer disposeInitPlayers;

  @override
  void initState() {
    super.initState();
    vm.getCameras();
    disposeInitPlayers = reaction((_) => vm.cameras.isNotEmpty, (msg) {
      if (vm.cameras.isNotEmpty) {
        WidgetsBinding.instance?.addPostFrameCallback((_) => vm.initPlayers());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SingleChildScrollView(
                  child: SizedBox(
                height: 400.0,
                child: Observer(builder: (_) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: vm.cameras.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return SizedBox(
                          height: 200.0,
                          width: 300.0,
                          child: vm.renderPlayer(vm.cameras[index]),
                        );
                      });
                }),
              )),
              SizedBox(
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getPlayButton(),
                    const SizedBox(
                      width: 20.0,
                      height: 20.0,
                    ),
                    _getPauseButton()
                  ],
                ),
              )
            ],
          )),
    );
  }

  InkWell _getPlayButton() {
    return InkWell(
      child: Icon(CustomIcons.play),
      onTap: _onPlayTap,
    );
  }

  void _onPlayTap() {
    vm.playMultiple();
  }

  InkWell _getPauseButton() {
    return InkWell(
      child: Icon(CustomIcons.pause),
      onTap: _onPauseTap,
    );
  }

  void _onPauseTap() {
    vm.pauseMultiple();
  }

  @override
  void dispose() {
    super.dispose();
    disposeInitPlayers();
    vm.dispose();
  }
}

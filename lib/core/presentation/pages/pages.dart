import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' show copyRotate, decodeImage;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils.dart';

/// https://flutter.dev/docs/cookbook/plugins/picture-using-camera
class TakePhotoPage extends StatefulWidget {
  final CameraDescription camera;

  const TakePhotoPage({Key key, @required this.camera}) : super(key: key);

  @override
  TakePhotoPageState createState() => TakePhotoPageState();
}

class TakePhotoPageState extends State<TakePhotoPage> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? CameraPreview(_controller)
                  : Center(child: CircularProgressIndicator()),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera_alt),
          onPressed: () async {
            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            await _controller.takePicture(path);

            Get.back(result: File(path));
          },
        ),
      );
}

class PickPhotoColorPage extends StatefulWidget {
  @override
  PickPhotoColorPageState createState() => PickPhotoColorPageState();
}

class PickPhotoColorPageState extends State<PickPhotoColorPage> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  Color selectedColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      Get.arguments as CameraDescription,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? Stack(
                      children: [
                        GestureDetector(
                          child: CameraPreview(_controller),
                          onTapUp: (details) async {
                            var path = join(
                                (await getTemporaryDirectory()).path,
                                '${DateTime.now()}.png');

                            await _controller.takePicture(path);

                            var image = copyRotate(
                              decodeImage(await File(path).readAsBytes()),
                              90,
                            );

                            var normalizedX = (details.globalPosition.dx /
                                    Get.mediaQuery.size.width *
                                    image.width)
                                .toInt();
                            var normalizedY = (details.globalPosition.dy /
                                    Get.mediaQuery.size.height *
                                    image.height)
                                .toInt();

                            var color = Color(
                              int.parse(
                                abgr2argb(
                                  image
                                      .getPixel(normalizedX, normalizedY)
                                      .toRadixString(16),
                                ),
                                radix: 16,
                              ),
                            );

                            setState(() => selectedColor = color);
                          },
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: SizedBox(
                            height: 80,
                            width: Get.mediaQuery.size.width - 28,
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 56,
                                      ),
                                      CircleAvatar(
                                        backgroundColor: selectedColor,
                                        radius: 28,
                                      ),
                                      FloatingActionButton(
                                        child: Icon(Icons.done),
                                        onPressed: () =>
                                            Get.back(result: selectedColor),
                                        backgroundColor: Colors.white,
                                      )
                                    ]),
                                SizedBox(height: 5),
                                Text(
                                  "Нажми на фото, чтобы стянуть цвет",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(child: CircularProgressIndicator()),
        ),
      );
}

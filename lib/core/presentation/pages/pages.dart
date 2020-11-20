import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/presentation/components/components.dart';
import '../pages/add-image.dart';

class UploadPhotoViaFileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FullWidthButton(
      text: "Из файла",
      onPressed: () async {
        var result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null) {
          var imageFile = File(result.files.single.path);
          Get.back(result: imageFile);
        }
      },
    );
  }
}

class UploadPhotoViaCameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FullWidthButton(
      text: "Из камеры",
      onPressed: () async {
        final cameras = await availableCameras();
        final firstCamera = cameras.first;
        var imageFile = await Get.to(TakePictureScreen(camera: firstCamera));
        Get.back(result: imageFile);
      },
    );
  }
}

class UploadPhotoViaLinkButtonAndInput extends StatefulWidget {
  @override
  _UploadPhotoViaLinkButtonAndInputState createState() =>
      _UploadPhotoViaLinkButtonAndInputState();
}

class _UploadPhotoViaLinkButtonAndInputState
    extends State<UploadPhotoViaLinkButtonAndInput> {
  var showInput = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullWidthButton(
          text: "По ссылке",
          onPressed: () => setState(() => showInput = true),
        ),
        if (showInput)
          LinkSubmitInput(
            hintText: "Ссылка на фотку со шмоткой",
            onSubmit: (imageUrl) async => Get.back(result: imageUrl),
          )
      ],
    );
  }
}

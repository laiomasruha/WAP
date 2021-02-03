import 'dart:io';

import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';

class ImageHandler {
  final DraftsController controller;
  final List<File> images;

  ImageHandler({this.controller, this.images}) {
    controller.indexTotalUploading = images.length;
    controller.indexUploading = 0;
  }

  Future<void> saveImages({int width}) async {
    controller.addImages(images: await _addFiles(width: width));
  }

  Future<List<ReportImageModel>> _addFiles({int width}) async {
    List<ReportImageModel> list = controller.draft.images;

    for (var i = 0; i < images.length; i++) {
      File file = await _resize(path: images[i].path, width: width);

      list.add(ReportImageModel(
        sub: "",
        image: images[i].path,
        thumb: file.path,
      ));

      controller.indexUploading++;
    }
    return list;
  }

  Future<File> _resize({String path, int width}) async {
    final int targetW = (width * 0.5).round();
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(path);
    return await FlutterNativeImage.compressImage(
      path,
      quality: 100,
      targetWidth: targetW,
      targetHeight: (properties.height * targetW / properties.width).round(),
    );
  }
}

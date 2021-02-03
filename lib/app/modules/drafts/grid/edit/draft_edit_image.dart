import 'dart:io';
import 'dart:ui' as ui;

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wapp_reports/app/components/progress-indicator.component.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/app/modules/drafts/grid/edit/draft_images_controller.dart';
import 'package:wapp_reports/app/modules/drafts/grid/edit/rpx-custom-image.view.dart';
import 'package:wapp_reports/app/modules/drafts/grid/edit/rpx-custom-shape-painter.view.dart';
import 'package:wapp_reports/settings.dart';

class DraftEditImage extends StatelessWidget {
  final ReportImageModel image;
  final String index;

  DraftEditImage({this.image, this.index});

  @override
  Widget build(BuildContext context) {
    final DraftImagesController controller =
        Modular.get<DraftImagesController>();
    final DraftsController draftsController = Modular.get<DraftsController>();

    void _settings(BuildContext context) {
      showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Wrap(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Settings.mediumGreyColor),
                    ),
                    child: CircleAvatar(
                      child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Settings.mediumGreyColor,
                          ),
                          onPressed: () => Navigator.of(context).pop()),
                      radius: 20,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Text(
                  "FORMA",
                  style: TextStyle(
                      color: Settings.darkGreyColor,
                      fontWeight: FontWeight.w600),
                ),
                ListTile(
                  title: StatefulBuilder(
                    builder: (context, setState) => Observer(
                      builder: (_) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              controller.setShape(1);
                            },
                            child: Material(
                              color: controller.shape == 1
                                  ? Settings.blueColor
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.crop_square,
                                  color: controller.shape == 1
                                      ? Colors.white
                                      : Settings.blueColor,
                                  size: 50,
                                ),
                              ),
                              shape: CircleBorder(),
                              elevation: 3.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.setShape(2);
                            },
                            child: Material(
                              color: controller.shape == 2
                                  ? Settings.blueColor
                                  : Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.panorama_fish_eye,
                                  color: controller.shape == 2
                                      ? Colors.white
                                      : Settings.blueColor,
                                  size: 50,
                                ),
                              ),
                              shape: CircleBorder(),
                              elevation: 3.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[10],
                  height: 40,
                ),
                Text(
                  "COR",
                  style: TextStyle(
                      color: Settings.darkGreyColor,
                      fontWeight: FontWeight.w600),
                ),
                ListTile(
                  title: StatefulBuilder(
                    builder: (context, setState) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext bc) {
                              return Container(
                                child: MaterialColorPicker(
                                    shrinkWrap: true,
                                    onlyShadeSelection: true,
                                    onColorChange: (color) {
                                      controller.setColor(color);
                                      Navigator.of(context).pop();
                                    },
                                    selectedColor: controller.color),
                              );
                            });
                      },
                      child: Observer(
                        builder: (context) => Material(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.color_lens,
                              color: controller.color,
                              size: 50,
                            ),
                          ),
                          shape: CircleBorder(),
                          elevation: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[10],
                  height: 40,
                ),
                Text(
                  "ESPESSURA",
                  style: TextStyle(
                      color: Settings.darkGreyColor,
                      fontWeight: FontWeight.w600),
                ),
                ListTile(
                  title: StatefulBuilder(
                    builder: (context, setState) => Observer(
                      builder: (_) => Slider(
                        value: controller.thick,
                        onChanged: (t) {
                          controller.setThick(t);
                        },
                        min: 6.0,
                        max: 14.0,
                        divisions: 4,
                        label:
                            "${((controller.thick.round() / 2) - 2).round()}",
                        activeColor: Settings.darkBlueColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void _back() {
      controller.removeLastPath();
    }

    Future<ui.Image> _loadImage(String path) async {
      final file = await File(path).readAsBytes();
      return await decodeImageFromList(file);
    }

    Future _saveImage({ReportImageModel image}) async {
      ui.PictureRecorder recorder = ui.PictureRecorder();

      Canvas canvas = Canvas(recorder);

      ui.Image img = await _loadImage(image.image);

      CustomShapePainter painter =
          CustomShapePainter(image: img, paths: controller.paths);

      var size = Size(img.width.toDouble(), img.height.toDouble());

      painter.paint(canvas, size);

      ui.Image newImg =
          await recorder.endRecording().toImage(img.width, img.height);

      final byteDataImage =
          await newImg.toByteData(format: ui.ImageByteFormat.png);

      final buffer = byteDataImage.buffer;

      List<String> newPath = image.image.split("/");

      String now = DateTime.now().millisecondsSinceEpoch.toString();
//      String base = "";
//      for (var i = 0; i < newPath.length - 1; i++) {
//        base += newPath[i] + "/";
//      }

      String newImagePath = now + ".jpg";

      Directory tempDir = await getTemporaryDirectory();
      final File file = File("${tempDir.path}$newImagePath");

      await file.writeAsBytes(
        buffer.asUint8List(
          byteDataImage.offsetInBytes,
          byteDataImage.lengthInBytes,
        ),
      );

      var decodedImage = await decodeImageFromList(file.readAsBytesSync());

      final int targetW = (decodedImage.width * 0.5).round();
      ImageProperties properties =
          await FlutterNativeImage.getImageProperties(file.path);

      File thumb = await FlutterNativeImage.compressImage(
        file.path,
        quality: 100,
        targetWidth: targetW,
        targetHeight: (properties.height * targetW / properties.width).round(),
      );

      ReportImageModel newImage = image;

      newImage.image = file.path;
      newImage.thumb = thumb.path;

      draftsController.updateImage(int.parse(index), newImage);

      controller.paths.clear();
      return;
    }

    return FutureBuilder(
        future: _loadImage(image.image),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Editar Imagem"),
                centerTitle: true,
                automaticallyImplyLeading: true,
              ),
              body: Center(
                child: GenericProgressIndicator(false),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("Editar Imagem"),
              automaticallyImplyLeading: true,
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.NO_HEADER,
                      body: Text("Salvando..."),
                      padding: EdgeInsets.all(10)
                    )..show();
                    _saveImage(image: this.image).then((value) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    });
                  },
                  icon: Icon(Icons.save),
                ),
                IconButton(
                  onPressed: () {
                    _settings(context);
                  },
                  icon: Icon(Icons.settings),
                ),
                Observer(
                  builder: (context) => controller.paths.length > 0
                      ? IconButton(
                          onPressed: () {
                            _back();
                          },
                          icon: Icon(Icons.undo),
                        )
                      : Container(),
                ),
              ],
            ),
            body: DraftCustomImage(imageModel: image, image: snapshot.data),
          );
        });
  }
}

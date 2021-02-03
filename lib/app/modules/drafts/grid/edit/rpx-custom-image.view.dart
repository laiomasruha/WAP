import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/modules/drafts/grid/edit/draft_images_controller.dart';
import 'package:wapp_reports/app/modules/drafts/grid/edit/rpx-custom-shape-painter.view.dart';

class DraftCustomImage extends StatefulWidget {
  final ReportImageModel imageModel;
  final ui.Image image;

  DraftCustomImage({this.imageModel, this.image});

  @override
  _DraftCustomImageState createState() => _DraftCustomImageState();
}

class _DraftCustomImageState extends State<DraftCustomImage> {
  @override
  Widget build(BuildContext context) {
    final DraftImagesController controller =
        Modular.get<DraftImagesController>();

    return FittedBox(
      child: SizedBox(
        width: this.widget.image.width.toDouble(),
        height: this.widget.image.height.toDouble(),
        child: GestureDetector(
          onPanStart: (details) {
            setState(() {
              Map m = Map();
              m['start'] =
                  Offset(details.localPosition.dx, details.localPosition.dy);
              m['shape'] = controller.shape;
              m['color'] = controller.color;
              m['thick'] = controller.thick;
              controller.addPath(m);
            });
          },
          onPanUpdate: (details) {
            if (details != null) {
              setState(() {
                Map element = controller.removeLastPath();
                element["end"] =
                    Offset(details.localPosition.dx, details.localPosition.dy);
                controller.addPath(element);
              });
            }
          },
          child: CustomPaint(
            painter: CustomShapePainter(
                paths: controller.paths, image: this.widget.image),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

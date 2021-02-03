import 'dart:io';

import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final String path;

  ImageGrid({this.path});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(path),
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }
}

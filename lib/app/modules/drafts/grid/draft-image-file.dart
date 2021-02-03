import 'dart:io';

import 'package:flutter/material.dart';

class DraftImageFile extends StatefulWidget {
  final String path;

  DraftImageFile({this.path});

  @override
  _DraftImageFileState createState() => _DraftImageFileState();
}

class _DraftImageFileState extends State<DraftImageFile> {
  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(widget.path),
      fit: BoxFit.cover,
      filterQuality: FilterQuality.low,
      cacheWidth: 100,
      cacheHeight: 100,
    );
  }
}

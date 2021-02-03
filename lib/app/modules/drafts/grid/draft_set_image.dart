import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/settings.dart';

class DraftSetImage extends StatefulWidget {
  final DraftsController controller;
  final String index;
  int i;

  DraftSetImage({@required this.controller, @required this.index}) {
    i = int.parse(index);
  }

  @override
  _DraftSetImageState createState() => _DraftSetImageState();
}

class _DraftSetImageState extends State<DraftSetImage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Legenda"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              if (_controller.text.length > 0) {
                ReportImageModel newItem =
                    widget.controller.draft.images[widget.i];
                newItem.sub = _controller.text.toUpperCase();
                widget.controller.updateImage(widget.i, newItem);
                Modular.to.pop();
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.NO_HEADER,
                  title: 'Opss',
                  desc: 'Favor inserir uma legenda antes de salvar.',
                  btnOkText: "Entendi",
                  btnOkOnPress: () => null,
                  btnOkColor: Settings.darkBlueColor,
                )..show();
              }
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: <Widget>[
                  Hero(
                    tag: "hero${widget.index}",
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                        File(widget.controller.draft.images[widget.i].image),
                      ),
                      placeholder: AssetImage("assets/loading.gif"),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: FloatingActionButton(
                      heroTag: "fb2",
                      backgroundColor: Settings.darkBlueColor,
                      onPressed: () {
                        Modular.link.pushNamed("/edit/image/${widget.index}",
                            arguments: widget.controller.draft
                                .images[int.parse(widget.index)]);
                      },
                      child: Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Settings.mediumGreyColor),
                  borderRadius: BorderRadius.circular(5),
                  color: Settings.lightGreyColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  autocorrect: true,
                  maxLines: 15,
//                    textInputAction: TextInputAction.newline,
                  decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintText: "Informe a legenda..."),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _controller.text = widget.controller.draft.images[widget.i].sub;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

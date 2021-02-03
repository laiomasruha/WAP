import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wapp_reports/app/components/tip.component.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/app/modules/drafts/grid/draft_image_handler.dart';
import 'package:wapp_reports/app/modules/drafts/grid/image_grid.dart';
import 'package:wapp_reports/functions.dart';
import 'package:wapp_reports/lists.dart';
import 'package:wapp_reports/settings.dart';

class DraftImagesGrid extends StatefulWidget {
  final DraftsController controller;

  DraftImagesGrid({@required this.controller});

  @override
  _DraftImagesGridState createState() => _DraftImagesGridState();
}

class _DraftImagesGridState extends State<DraftImagesGrid> {
  @override
  Widget build(BuildContext context) {
    Future _gallery() async {
      List<File> resultList;

      try {
        resultList = await FilePicker.getMultiFile(
          type: FileType.image,
          onFileLoading: (status) {
            if (status.index == 0) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.NO_HEADER,
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("Processando Imagens"),
                    SizedBox(
                      height: 10,
                    ),
                    Observer(
                        builder: (_) => Text(widget.controller.indexUploading
                                .toString() +
                            " de " +
                            widget.controller.indexTotalUploading.toString())),
                  ],
                ),
                dismissOnBackKeyPress: false,
                dismissOnTouchOutside: false,
              )..show();
            }
          },
        );

        if (resultList != null) {
          ImageHandler imageControl = ImageHandler(
            controller: widget.controller,
            images: resultList,
          );
          await imageControl.saveImages(
            width: MediaQuery.of(context).size.width.round(),
          );
        }

        Modular.link.pop();
      } on Exception catch (e) {
        print(e);
      }
    }

    void _clearAllImages() async {
      widget.controller.draft.images.clear();
      FilePicker.clearTemporaryFiles();
      final Directory _temp = await getExternalStorageDirectory();
      final Directory _tempDir = Directory("${_temp.parent.path}/cache");
      _tempDir.deleteSync(recursive: true);
      widget.controller.setDraft(widget.controller.draft);
    }

    Widget _clearAllDialog() {
      return FlatButton(
        onPressed: () => AwesomeDialog(
          context: context,
          padding: EdgeInsets.all(15),
          title: "Remover imagens?",
          desc:
              "Você tem certeza que deseja remover todas as imagens? Esta ação não pode ser revertida.",
          btnOkText: "Sim",
          btnOkOnPress: () => _clearAllImages(),
          btnCancelText: "Não",
          btnCancelOnPress: () => null,
          dialogType: DialogType.NO_HEADER,
          dismissOnBackKeyPress: false,
          dismissOnTouchOutside: false,
        )..show(),
        child: Text(
          "Remover tudo",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Settings.darkBlueColor,
        title: Text(
          functions.ucWords(lists.arrayList[ListType.images.index]),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          Observer(
            builder: (_) => widget.controller.draft.images.length > 0
                ? _clearAllDialog()
                : SizedBox(
                    width: 0,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () {
          _gallery();
        },
      ),
      body: Observer(
        builder: (_) => (widget.controller.draft.images != null &&
                widget.controller.draft.images.length > 0)
            ? SafeArea(
                child: GridView.builder(
                  itemCount: widget.controller.draft.images.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 4, bottom: 4),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(right: 4, bottom: 4),
                      onLongPress: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.NO_HEADER,
                          title: 'Remover Imagem',
                          desc:
                              'Você tem certeza de que quer realizar esta operação? Esta ação não pode ser desfeita.',
                          btnCancelText: "Cancelar",
                          btnOkText: "Deletar",
                          btnOkOnPress: () =>
                              widget.controller.removeImage(index),
                          btnCancelOnPress: () => null,
                        )..show();
                      },
                      onTap: () async {
                        var removeItem = await Modular.link.pushNamed(
                          "/set-image/$index",
                          arguments: widget.controller,
                        );

                        if (removeItem != null) {
                          print("beleus");
                          widget.controller.removeImage(removeItem);
                        }
                      },
                      title: Container(
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.all(0),
                        child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Hero(
                              tag: "hero${index.toString()}",
                              child: ImageGrid(
                                path:
                                    widget.controller.draft.images[index].thumb,
                              ),
                            ),
                            widget.controller.draft.images[index].sub != ""
                                ? Icon(
                                    Icons.comment,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.comment,
                                    color: Colors.transparent,
                                  ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : Tip(
                icon: Icons.info,
                title: "Opss",
                subtitle:
                    "Ainda não existem itens nessa seção. Para adicionar itens, use o botão abaixo."),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wapp_reports/app/components/tip.component.dart';
import 'package:wapp_reports/app/modules/drafts/components/custom-text-field.generic.component.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/settings.dart';
import 'package:wapp_reports/user.dart';

class DraftSenderList extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();
  final DraftsController controller = Modular.get<DraftsController>();

  @override
  Widget build(BuildContext context) {
    void _addItem() {
      if (_controller.text.trim().isNotEmpty) {
        controller.addEmail(_controller.text);
        _controller.clear();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Emails",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.send,
              size: 20,
            ),
            onPressed: () {
              Modular.to.pushNamed("/sync");
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(user.email),
            subtitle: Text("Envio Padrão", style: TextStyle(fontStyle: FontStyle.italic),),
            leading: Icon(
              Icons.mail,
              color: Colors.blueGrey,
              size: 40,
            ),
          ),
          Divider(),
          Expanded(
            child: Observer(
              builder: (_) => (controller.emails != null &&
                      controller.emails.length > 0)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.emails != null
                          ? controller.emails.length
                          : 1,
                      itemBuilder: (context, index) {

                        TextEditingController _controller1 =
                            new TextEditingController();
                        _controller1.text = controller.emails[index];

                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: Container(
                            child: ListTile(
                              title: Text(controller.emails[index]),
                              leading: Icon(
                                Icons.mail_outline,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Deletar',
                              color: Colors.red,
                              icon: Icons.delete,
                              closeOnTap: true,
                              onTap: () {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.NO_HEADER,
                                  title: "Confirme",
                                  desc:
                                      "Você tem certeza que deseja apagar este email? Esta ação não pode ser desfeita.",
                                  btnOkOnPress: () =>
                                      controller.removeEmail(index),
                                  btnOkText: "Sim",
                                  btnCancelText: "Não",
                                  btnCancelOnPress: () => null,
                                )..show();
                              },
                            ),
                          ],
                        );
                      },
                    )
                  : Tip(
                      icon: Icons.info,
                      title: "Opss",
                      subtitle:
                          "Ainda não existem itens nessa seção. Para adicionar itens, use o campo acima."),
            ),
          ),
          Container(
            color: Settings.lightGreyColor,
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GenericCustomListTextField(
                    controller: controller,
                    textController: _controller,
                  ),
                ),
                SizedBox(width: 8),
                Observer(
                  builder: (_) => CircleAvatar(
                    backgroundColor: controller.isEditing == true
                        ? Settings.darkBlueColor
                        : Settings.darkGreyColor,
                    radius: 23,
                    child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () =>
                          controller.isEditing == true ? _addItem() : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

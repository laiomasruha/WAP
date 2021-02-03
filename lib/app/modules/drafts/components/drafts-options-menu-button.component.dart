import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/settings.dart';

class DraftsOptionsMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<DraftsController>();

    return IconButton(
      icon: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                      leading: new Icon(Icons.delete_forever),
                      title: new Text('Limpar Dados'),
                      onTap: () async {
                        Modular.link.pop();
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.NO_HEADER,
                          title: 'Limpar Dados',
                          desc:
                              'Tem certeza qe deseja limpar os dados do relatório? Esta ação não pode ser desfeita.',
                          btnOkText: "Limpar",
                          btnOkOnPress: () => controller.resetDraft(),
                          btnOkColor: Settings.darkBlueColor,
                          btnCancelText: "Cancelar",
                          btnCancelOnPress: () => null,
                        )..show();
                      },
                    ),
                    new ListTile(
                      leading: new Icon(Icons.restore_page),
                      title: new Text('Sincronizar'),
                      onTap: () {
                        if (controller.draft.title == null || controller.draft.title == "(Sem título)" || controller.draft.title == "") {
                          Modular.to.pop();
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            title: 'Atenção',
                            desc:
                            'Você precisa ao menos informar um título para sincronizar o relatório.',
                            btnOkText: "Entendi",
                            btnOkOnPress: () => null,
                            btnOkColor: Settings.darkBlueColor,
                          )..show();
                        } else {
                          Modular.link.popAndPushNamed("/sender");
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

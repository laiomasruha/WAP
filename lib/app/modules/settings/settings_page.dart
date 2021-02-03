import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/components/loading.component.dart';
import 'package:wapp_reports/app/components/progress-indicator.component.dart';
import 'package:wapp_reports/lists.dart';
import 'package:wapp_reports/settings.dart';
import 'settings_controller.dart';

class SettingsPage extends StatefulWidget {
  final String title;

  const SettingsPage({Key key, this.title = "Configurações"}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState
    extends ModularState<SettingsPage, SettingsController> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final controller = Modular.get<SettingsController>();
  Future<void> future;

  @override
  void initState() {
    future = controller.getConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Settings.darkBlueColor,
        centerTitle: true,
        elevation: 1,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              controller.save(map: {
                ListType.services.index: _controller1,
                ListType.staff.index: _controller2,
                ListType.obs.index: _controller3,
                ListType.images.index: _controller4,
              });

              AwesomeDialog(
                context: context,
                dialogType: DialogType.NO_HEADER,
                title: 'Tudo certo!',
                desc: 'Configurações atualizadas com sucesso.',
                btnOkText: "Entendi",
                btnOkOnPress: () => null,
              )..show();
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            return Center(child: GenericProgressIndicator(false),);
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30),
                child: Observer(
                  builder: (_) => Loading(
                    isLoading: controller.isLoading,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Nome atual da lista de texto 1: ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          controller: _controller1,
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          textInputAction: TextInputAction.newline,
                          decoration: new InputDecoration(
                            hintText: lists.arrayList[ListType.services.index],
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Settings.darkGreyColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Nome atual da lista de texto 2: ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          controller: _controller2,
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          textInputAction: TextInputAction.newline,
                          decoration: new InputDecoration(
                            hintText: controller.list[ListType.staff.index],
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Settings.darkGreyColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Nome atual da lista de texto 3: ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          controller: _controller3,
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          textInputAction: TextInputAction.newline,
                          decoration: new InputDecoration(
                            hintText: controller.list[ListType.obs.index],
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Settings.darkGreyColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Nome atual da lista de imagens: ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextFormField(
                          controller: _controller4,
                          keyboardType: TextInputType.text,
                          autocorrect: true,
                          textInputAction: TextInputAction.newline,
                          decoration: new InputDecoration(
                            hintText: controller.list[ListType.images.index],
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Settings.darkGreyColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Settings.darkBlueColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

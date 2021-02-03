import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/app/modules/report/report_controller.dart';
import 'package:wapp_reports/settings.dart';

class ReportPage extends StatelessWidget {
  final ReportModel item;

  ReportPage({this.item});

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd/MM/yyyy');
    final reportDate = DateTime.parse(item.reportDate);
    final ReportController controller = Modular.get<ReportController>();

    _onOkCopy() async {
      bool done = await controller.copyToRpx(item);
      if (done == true) {
        Modular.to.pop();
        Modular.to.popAndPushNamed("/drafts");
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.NO_HEADER,
          padding: EdgeInsets.all(20),
          title: "Opsss",
          body: Text("Algo não ocorreu como esperávamos. Tente novamente."),
          btnOkText: "Ok, fechar!",
          btnOkOnPress: () => Modular.to.pop(),
        )..show();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Relatório",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.content_copy),
                        title: Text("Copiar como Novo Relatório"),
                        onTap: () async {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.NO_HEADER,
                            padding: EdgeInsets.all(20),
                            title: "Você tem certeza?",
                            dismissOnTouchOutside: false,
                            dismissOnBackKeyPress: false,
                            body: Text(
                                "Ao continuar você perderá todos os dados inseridos previamente no Novo Relatório. Lembrando que esta ação não funciona para Imagens, somente listas de textos. Esta ação não pode ser desfeita."),
                            btnOkText: "Sim",
                            btnOkOnPress: () => _onOkCopy(),
                            btnCancelText: "Não",
                            btnCancelOnPress: () => Modular.to.pop(),
                          )..show();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Enviar Relatório"),
                        onTap: () => Modular.link.popAndPushNamed(
                            "/report-sender",
                            arguments: item.id),
                      ),
                      ListTile(
                        leading: Icon(Icons.search),
                        title: Text("Histórico de Envios"),
                        onTap: () {
                          Modular.link.popAndPushNamed("/report-log",
                              arguments: item.id);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildHeader(context, item.title, formatter.format(reportDate)),
              _buildTitle(context, "Serviços", item.services),
              _buildItens(context, item.services, 'services'),
              _buildTitle(context, "Participantes", item.staff),
              _buildItens(context, item.staff, 'staff'),
              _buildTitle(context, "Observações", item.obs),
              _buildItens(context, item.obs, 'obs'),
              _buildTitle(context, "Imagens", item.images),
              _buildImages(context, item.images)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, String title, String rpxdate) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(52, 67, 87, 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 17.0),
          ),
          Text(
            rpxdate,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 15.0,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title, List list) {
    var flag = list?.length ?? 0;
    return flag > 0
        ? Column(
            children: <Widget>[
              Divider(
                height: 0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                alignment: Alignment.centerLeft,
                child: Chip(
                  label: Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )
        : SizedBox.shrink();
  }

  Widget _buildItens(BuildContext context, List<String> list, String section) {
    return ListView.builder(
      itemCount: list?.length ?? 0,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            list[index],
          ),
        );
      },
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
    );
  }

  Widget _buildImages(BuildContext context, List<ReportImageModel> list) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: CustomScrollView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.NO_HEADER,
                      body: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: Image.network(
                                Settings.url + "/storage/" + list[index].image),
                          ),
                          Text(
                            list[index].sub.trim() != ""
                                ? list[index].sub.trim()
                                : "",
                          ),
                        ],
                      ),
                    )..show();
                  },
                  child: Container(
                    height: 150.0,
                    padding: EdgeInsets.only(right: 5.0, bottom: 5.0),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        Material(
                          child: Image.network(
                            Settings.url + "/storage/" + list[index].image,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.height / 2,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : LinearProgressIndicator();
                            },
                          ),
                          elevation: 2,
                          color: Color.fromRGBO(240, 240, 240, 1),
                        ),
                        list[index].sub.trim() != ""
                            ? Icon(
                                Icons.lens,
                                color: Settings.lightBlueColor,
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
              childCount: list?.length ?? 0,
            ),
          )
        ],
      ),
    );
  }
}

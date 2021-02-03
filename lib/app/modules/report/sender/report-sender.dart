import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wapp_reports/settings.dart';

class ReportSenderPages extends StatelessWidget {
  final String id;

  ReportSenderPages({this.id});

  final _controller = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
//    final store = Provider.of<ReportStore>(context);
//    final controller = ReportController(store);
//    controller.getEmails();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Enviar Relatório",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
//              if (store.emails.length > 0) {
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                    builder: (_) => ReportSendingView(this.id),
//                  ),
//                );
//              } else {
//                final snack = SnackBar(
//                  backgroundColor: Colors.blueAccent,
//                  content: Text(
//                    "Favor inserir ao menos um email",
//                    style: TextStyle(color: Colors.white),
//                  ),
//                  duration: Duration(seconds: 4),
//                );
//                _scaffoldKey.currentState.showSnackBar(snack);
//              }
            },
          ),
        ],
      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              Expanded(
                child: CupertinoTextField(
                  placeholder: 'Informe um email...',
                  autocorrect: true,
                  autofocus: true,
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (email) {
//                    controller.addEmail(email);
                    _controller.clear();
                  },
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(style: BorderStyle.none),
                      left: BorderSide(style: BorderStyle.none),
                      right: BorderSide(style: BorderStyle.none),
                      top: BorderSide(style: BorderStyle.none),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
//                  controller.addEmail(_controller.text);
                  _controller.clear();
                },
                icon: Icon(Icons.add_circle),
                color: Settings.blueColor,
              ),
            ],
          ),
        ),
//        body: Observer(
//          builder: (_) => Loading(
//            isLoading: store.isLoading,
//            child: store.emails.length == 0
//                ? Tip(
//                    icon: Icons.info,
//                    title: "Opss",
//                    subtitle: "Não existem itens nesta seção.",
//                  )
//                : SafeArea(
//                    child: SingleChildScrollView(
//                      child: ListView.builder(
//                        shrinkWrap: true,
//                        itemCount: 1,
////                        itemCount: store.emails.length,
//                        itemBuilder: (context, index) {
////                          var email = store.emails[index];
//                          TextEditingController _controller1 =
//                              new TextEditingController();
////                          _controller1.text = email;
//
//                          return Dismissible(
//                            key: UniqueKey(),
//                            child: ListTile(
////                              title: Text(email.toLowerCase()),
//                              leading: Icon(
//                                Icons.email,
//                                color: Colors.blueGrey,
//                              ),
//                            ),
//                            background: Container(
//                              padding: EdgeInsets.symmetric(horizontal: 15),
//                              color: Colors.red,
//                              child: Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceBetween,
//                                children: <Widget>[
//                                  Icon(
//                                    Icons.delete,
//                                    color: Colors.white,
//                                  ),
//                                  Icon(
//                                    Icons.delete,
//                                    color: Colors.white,
//                                  ),
//                                ],
//                              ),
//                            ),
//                            direction: DismissDirection.horizontal,
//                            onDismissed: (direction) {
////                              controller.removeEmail(index);
//                            },
//                          );
//                        },
//                      ),
//                    ),
//                  ),
//          ),
//        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ReportSendingView extends StatelessWidget {
  final String id;

  ReportSendingView(this.id);

  @override
  Widget build(BuildContext context) {
//    final store = Provider.of<ReportSendingStore>(context);
//    final controller = ReportSendingController(store);

//    store.setId(this.id);
//
//    if (store.currentState == "initial") {
//      controller.changeState("process");
//    }

    // ignore: missing_return
    return Observer(
      builder: (_) {
//        switch (store.currentState) {
//          case 'process':
//            return ReportSendingProcessView();
//            break;
//          case 'success':
//            return ReportSendingSuccessView();
//            break;
//          case 'error':
//            return ReportSendingErrorView();
//            break;
//          default:
//            return ReportSendingProcessView();
//            break;
//        }
      },
    );
  }
}

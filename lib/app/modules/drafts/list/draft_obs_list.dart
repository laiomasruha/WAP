import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wapp_reports/app/components/tip.component.dart';
import 'package:wapp_reports/app/modules/drafts/components/custom-text-field.generic.component.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/functions.dart';
import 'package:wapp_reports/lists.dart';
import 'package:wapp_reports/settings.dart';

class DraftObsList extends StatelessWidget {
  final TextEditingController _controller = new TextEditingController();
  final DraftsController controller;

  DraftObsList({@required this.controller});

  @override
  Widget build(BuildContext context) {
    void _addItem() {
      if (_controller.text.trim().isNotEmpty) {
        controller.add(_controller.text.trim().toUpperCase(), ListType.obs);
        _controller.clear();
      }
    }

    void _reorderItem(bool plus) {
      int factor = plus == true ? 1 : -1;

      if (0 <= controller.indexOrdering + factor &&
          controller.indexOrdering + factor < controller.draft.obs.length) {
        String obs = controller.draft.obs[controller.indexOrdering];
        controller.remove(controller.indexOrdering, ListType.obs);
        controller.indexOrdering = controller.indexOrdering + factor;
        controller.insert(controller.indexOrdering, obs, ListType.obs);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => controller.isOrdering == true
              ? SizedBox()
              : Text(
                  functions.ucWords(lists.arrayList[ListType.obs.index]),
                  style: TextStyle(color: Colors.white),
                ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: <Widget>[
          Observer(
            builder: (_) => controller.isOrdering == true
                ? IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      controller.isOrdering = false;
                    })
                : SizedBox(),
          ),
          Observer(
            builder: (_) => controller.isOrdering == true
                ? IconButton(
                    icon: Icon(Icons.arrow_upward),
                    onPressed: () {
                      _reorderItem(false);
                    })
                : SizedBox(),
          ),
          Observer(
            builder: (_) => controller.isOrdering == true
                ? IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      _reorderItem(true);
                    })
                : SizedBox(),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_) => (controller.draft.obs != null &&
                      controller.draft.obs.length > 0)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.draft.obs != null
                          ? controller.draft.obs.length
                          : 1,
                      itemBuilder: (context, index) {
                        String _lastServiceRemoved;
                        int _lastIndexRemoved;

                        TextEditingController _controller1 =
                            new TextEditingController();
                        _controller1.text = controller.draft.obs[index];

                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: Container(
                            child: ListTile(
                              title: Text(controller.draft.obs[index]),
                              leading: Observer(
                                builder: (_) => controller.isOrdering == true
                                    ? Icon(
                                        Icons.swap_vert,
                                        color: Colors.blueAccent,
                                      )
                                    : Icon(
                                        Icons.subdirectory_arrow_right,
                                        color: Colors.blueGrey,
                                      ),
                              ),
                            ),
                          ),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Ordenar',
                              color: Colors.orangeAccent,
                              icon: Icons.swap_vert,
                              closeOnTap: true,
                              onTap: () async {
                                controller.indexOrdering = index;
                                controller.isOrdering = true;
                                return;
                              },
                            ),
                            IconSlideAction(
                              caption: 'Editar',
                              color: Colors.blueAccent,
                              icon: Icons.edit,
                              closeOnTap: true,
                              onTap: () async {
                                final item = await Modular.link.pushNamed(
                                    "/edit/${controller.draft.obs[index]}");

                                if (item != null) {
                                  controller.update(index, item, ListType.obs);
                                }
                              },
                            ),
                            IconSlideAction(
                              caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              closeOnTap: true,
                              onTap: () {
                                _lastServiceRemoved =
                                    controller.get(index, ListType.obs);
                                _lastIndexRemoved = index;
                                controller.remove(index, ListType.obs);

                                final snack = SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Settings.lightBlueColor,
                                  content: Text(
                                    "Item removido!",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  action: SnackBarAction(
                                    label: "Desfazer",
                                    textColor: Colors.white,
                                    onPressed: () {
                                      controller.insert(
                                        _lastIndexRemoved,
                                        _lastServiceRemoved,
                                        ListType.obs,
                                      );
                                    },
                                  ),
                                  duration: Duration(seconds: 3),
                                );

                                Scaffold.of(context).showSnackBar(snack);
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

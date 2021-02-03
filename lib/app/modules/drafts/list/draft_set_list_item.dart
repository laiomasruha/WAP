import 'package:flutter/material.dart';

class DraftSetListItem extends StatefulWidget {
  final String item;

  DraftSetListItem({@required this.item});

  @override
  _DraftSetListItemState createState() => _DraftSetListItemState(this.item);
}

class _DraftSetListItemState extends State<DraftSetListItem> {
  final String item;

  _DraftSetListItemState(this.item);

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Item"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(_controller.text.toUpperCase());
            },
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            autofocus: true,
            autocorrect: true,
            maxLines: null,
            textInputAction: TextInputAction.newline,
            decoration: new InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}

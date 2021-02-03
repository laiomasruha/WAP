import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/models/report-model.dart';

class ReportsSearch extends SearchDelegate<String> {
  final List<ReportModel> list;

  ReportsSearch(this.list);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? list
        : list
            .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.separated(
      itemCount: suggestionList.length,
      separatorBuilder: (context, index) => Divider(
        color: Color.fromRGBO(220, 220, 220, 1.0),
      ),
      itemBuilder: (context, index) {
        ReportModel item = suggestionList[index];
        return ListTile(
          onTap: () {
            imageCache.clear();
            Modular.to.pushNamed("/report", arguments: item);
          },
          title: Text(
            item.title.replaceAll("\n", " ").trim(),
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

/// flutter pub add search_choices

class SearchableDropdownScreen extends StatefulWidget {
  @override
  _SearchableDropdownScreenState createState() => _SearchableDropdownScreenState();
}

class _SearchableDropdownScreenState extends State<SearchableDropdownScreen> {
  String? selectedValueSingleDialog;
  List<int> selectedItemsMultiDialog = [];
  List<DropdownMenuItem> items = [];

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      items.add(
        DropdownMenuItem(
          child: Text("hello ${i + 1}"),
          value: '${i + 1}',
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets;
    widgets = {
      "Single dialog": SearchChoices.single(
        items: items,
        value: selectedValueSingleDialog,
        hint: "Select one",
        searchHint: "Select one",
        searchFn: (String keyword, items) {
          List<int> ret = [];
          if (items != null && keyword.isNotEmpty) {
            keyword.split(" ").forEach((k) {
              int i = 0;
              items.forEach((item) {
                if (k.isNotEmpty &&
                    (item.child as Text)
                        .data
                        .toString()
                        .toLowerCase()
                        .contains(k.toLowerCase())) {
                  ret.add(i);
                }
                i++;
              });
            });
          }
          if (keyword.isEmpty) {
            ret = Iterable<int>.generate(items.length).toList();
          }
          return (ret);
        },
        onChanged: (value) {
          setState(() {
            selectedValueSingleDialog = value;
          });
        },
        isExpanded: true,
      ),
      "Multi dialog": SearchChoices.multiple(
        items: items,
        selectedItems: selectedItemsMultiDialog,
        hint: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Select any"),
        ),
        searchHint: "Select any",
        searchFn: (String keyword, items) {
          List<int> ret = [];
          if (items != null && keyword.isNotEmpty) {
            keyword.split(" ").forEach((k) {
              int i = 0;
              items.forEach((item) {
                if (k.isNotEmpty &&
                    (item.child as Text)
                        .data
                        .toString()
                        .toLowerCase()
                        .contains(k.toLowerCase())) {
                  ret.add(i);
                }
                i++;
              });
            });
          }
          if (keyword.isEmpty) {
            ret = Iterable<int>.generate(items.length).toList();
          }
          return (ret);
        },
        onChanged: (value) {
          setState(() {
            selectedItemsMultiDialog = value;
          });
        },
        closeButton: (selectedItems) {
          return (selectedItems.isNotEmpty
              ? "Save ${selectedItems.length == 1 ? '"' + items[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
              : "Save without selection");
        },
        isExpanded: true,
      ),
    };

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Choice"),
      ),
      body: ListView(
        children: widgets
            .map((k, v) {
              return MapEntry(
                k,
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Text("$k:"),
                          v,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
            .values
            .toList()
              ..add(
                Center(
                  child: SizedBox(
                    height: 500,
                  ),
                ),
              ), //prevents scrolling issues at the end of the list of Widgets
      ),
    );
  }
}

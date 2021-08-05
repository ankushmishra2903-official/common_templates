import 'package:flutter/material.dart';

/// my own.

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  _SearchBarScreenState createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  List _tempList = [];
  List _allList = [];

  bool _isSearching = false;

  String _query = '';
  TextEditingController _tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    getList();
  }

  getList() async {
    /// initialize list and add it to tempList
    _allList = [
      {
        "name": "Ankush",
        "id": "1",
      },
      {
        "name": "Aparna",
        "id": "2",
      },
      {
        "name": "Akash",
        "id": "3",
      },
      {
        "name": "Mishra",
        "id": "4",
      },
    ];

    _tempList.addAll(_allList);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !_isSearching,
        centerTitle: true,
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 800),
          transitionBuilder: (child, animation) => SizeTransition(
            sizeFactor: animation,
            child: child,
            axis: Axis.horizontal,
            axisAlignment: 10,
          ),
          child: _isSearching
              ? TextFormField(
                  controller: _tc,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  onEditingComplete: () {
                    setState(() {
                      _isSearching = false;
                    });
                  },
                  autofocus: _isSearching,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                          right: Radius.circular(50),
                        ),
                        borderSide: BorderSide.none),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isSearching = false;
                        });
                      },
                      icon: Icon(Icons.search),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _tc.clear();
                          _query = '';
                          _tempList = _allList;
                          _isSearching = false;
                        });
                      },
                      icon: Icon(Icons.close),
                    ),
                    fillColor: Colors.white,
                  ),
                  onChanged: (v) {
                    setState(() {
                      _query = v;
                      newList(_query);
                    });
                  },
                )
              : Text(_query.isNotEmpty ? '$_query' : 'Search bar in list'),
        ),
        actions: [
          if (!_isSearching) ...[
            IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = true;
                });
              },
              icon: Icon(Icons.search),
            )
          ]
        ],
      ),
      body: _tempList.length == 0
          ? Center(
            child: Container(
                child: Text(_query.isNotEmpty
                    ? 'No result Match with $_query'
                    : 'No result Found')),
          )
          : ListView.builder(
              itemCount: _tempList.length,
              itemBuilder: (context, index) {
                _tempList.sort((a, b) {
                  return a['name'].toString().toLowerCase().compareTo(
                        b['name'].toString().toLowerCase(),
                      );
                });
                return Card(
                  child: ListTile(
                    title: Text(_tempList[index]['name']),
                    subtitle:
                        Text("Id. ${_tempList[index]['id']}"),
                  ),
                );
              },
            ),
    );
  }

  void newList(String query) {
    _tempList = _allList.where(
      (elem) {
        return elem['name']
                .toString()
                .toLowerCase()
                .startsWith(query.toLowerCase()) ||
            elem['id']
                .toString()
                .toLowerCase()
                .startsWith(query.toLowerCase());
      },
    ).toList();
  }
}

import 'package:custom_grid_view/custom_grid_view.dart';
import 'package:flutter/material.dart';

/// flutter pub add custom_grid_view
class MyGridView extends StatelessWidget {
  MyGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
      ),
      body: CustomGridView(
        rows: 2,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

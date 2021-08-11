import 'package:flutter/material.dart';


class HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeScreenDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: Text('Home Screen Desktop'),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:shimmer_image/shimmer_image.dart';

class SimmerExampleScreen extends StatelessWidget {
  const SimmerExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simmer example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("simmer_image"),
            ProgressiveImage(
              width: 300.0,
              image: 'https://wallpapercave.com/wp/wp4600617.jpg',
              height: 200.0,
            ),
            Text("flutter_shimmer/ListTileShimmer"),
            ListTileShimmer(
              isDisabledButton: true,
            ),
            Text("flutter_shimmer/PlayStoreShimmer"),
            PlayStoreShimmer(),
            Text("flutter_shimmer/ProfilePageShimmer"),
            ProfilePageShimmer(),
            Text("flutter_shimmer/ProfileShimmer"),
            ProfileShimmer(),
          ],
        ),
      ),
    );
  }
}

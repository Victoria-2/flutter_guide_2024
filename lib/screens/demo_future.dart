import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/models/demo_photos.dart';

import 'package:flutter_guide_2024/helpers/future_photos.dart';

class FutureDemoScreen extends StatelessWidget {
  const FutureDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FutureDemoScreen')),
      body: BodyFuture(),
    );
  }
}

class BodyFuture extends StatefulWidget {
  const BodyFuture({
    super.key,
  });

  @override
  State<BodyFuture> createState() => _BodyFutureState();
}

class _BodyFutureState extends State<BodyFuture> {
  late Future<List<Photos>> futureFotos;

  @override
  void initState() {
    super.initState();
    futureFotos = FuturePhotos.fetchFotos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Photos>>(
        future: futureFotos,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Image.network(snapshot.data![index].urls.regular);
                  },
                )
              : snapshot.hasError
                  ? Text('Error: ${snapshot.error}')
                  : const CircularProgressIndicator();
        },
      ),
    );
  }
}

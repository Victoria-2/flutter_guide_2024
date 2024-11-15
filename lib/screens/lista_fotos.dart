import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/helpers/photos_future.dart';
import 'package:flutter_guide_2024/models/foto_model.dart';

class ListaFotosScreen extends StatelessWidget {
  const ListaFotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListaFotosScreen')),
      body: BodyListaFotos(),
    );
  }
}

class BodyListaFotos extends StatefulWidget {
  const BodyListaFotos({
    super.key,
  });

  @override
  State<BodyListaFotos> createState() => _BodyListaFotosState();
}

class _BodyListaFotosState extends State<BodyListaFotos> {
  late Future<List<Photos>> listaFotos;
  int currentPage = 1;
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    listaFotos = FotosFuture.getPhotos(currentPage);
    scrollController.addListener(() {
      print(scrollController.position.pixels);
      print(scrollController.position.maxScrollExtent);
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        print('refresh');
        setState(() {
          print(currentPage);
          currentPage = currentPage + 1;
          listaFotos = FotosFuture.getPhotos(currentPage);
        });
      },
      child: FutureBuilder(
        future: listaFotos,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            return ListView.builder(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                /* return Image.network(snapshot.data![index].urls.regular); */
                return FadeInImage(
                    placeholder: AssetImage('assets/loading.gif'),
                    image: NetworkImage(snapshot.data![index].urls.regular));
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}

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

  @override
  void initState() {
    super.initState();
    listaFotos = FotosFuture.getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: listaFotos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
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
    );
  }
}

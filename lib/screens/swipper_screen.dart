import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/providers/people_provider.dart';
import 'package:flutter_guide_2024/widgets/card_horizontal_swiper.dart';
import 'package:provider/provider.dart';

class SwipperScreen extends StatelessWidget {
  const SwipperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider_people = Provider.of<PeopleProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;

    log(' ${size.width} ${size.height}');

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CardPoster(size: size),
              CardDetail(size: size),
              CardHorizontalSwiper(
                  size: size,
                  title: 'Empleados',
                  people: provider_people.listPeople,
                  onNext: () {
                    if (provider_people.isLoading) {
                      print('cargando... peticion abortada');
                      return;
                    }
                    provider_people.getPeople();
                  },
                  verMas: () {
                    print('Ver mas');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDetail extends StatelessWidget {
  final Size size;

  const CardDetail({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.18,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Juegos de Tronos',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Mollit ad labore commodo laborum.Mollit ad labore commodo laborum. Mollit ad labore commodo laborum. Veniam irure ad deserunt officia. Voluptate Lorem occaecat commodo ea magna reprehenderit dolore cupidatat ea est do. Mollit ad labore commodo laborum. Veniam irure ad deserunt officia. Voluptate Lorem occaecat commodo ea magna reprehenderit dolore cupidatat ea est do.',
            textAlign: TextAlign.justify,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CardPoster extends StatelessWidget {
  Size size;
  CardPoster({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      SizedBox(
        width: double.infinity,
        height: size.height * 0.40,
        child: const FadeInImage(
            fit: BoxFit.fill,
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z9gCSwIObDOD2BEtmUwfasar3xs.jpg')),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            log('tap search');
          },
          child: const CircleAvatar(
            child: Icon(Icons.search),
          ),
        ),
      ),
      Positioned(
        top: 80,
        left: 10,
        child: GestureDetector(
          onTap: () {
            log('tap volver');
          },
          child: const CircleAvatar(
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }
}

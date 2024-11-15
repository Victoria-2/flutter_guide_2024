import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/mocks/staff_mock.dart' show castMovies;
import 'package:flutter_guide_2024/models/people_model.dart';

class CardHorizontalSwiper extends StatelessWidget {
  final Size size;
  String? title;
  Function verMas;
  List<People> people = [];

  CardHorizontalSwiper({
    super.key,
    required this.size,
    required this.verMas,
    required this.people,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.33,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.title!),
                TextButton(
                    style: const ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 11, 59, 118)),
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 52, 112, 172)),
                    ),
                    onPressed: () {
                      log('click ver mas');
                    },
                    child: const Text('Ver mas')),
              ],
            ),
          ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: people.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(31, 173, 179, 194),
                        blurRadius: 1,
                        spreadRadius: 5,
                        offset: Offset(0, 5))
                  ],
                ),
                width: 150,
                height: 180,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage(
                          width: 150,
                          height: 160,
                          fit: BoxFit.cover,
                          placeholder:
                              const AssetImage('assets/images/loading.gif'),
                          image: NetworkImage(people[index].image)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      '${people[index].firstname} ${people[index].lastname}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      people[index].company,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}

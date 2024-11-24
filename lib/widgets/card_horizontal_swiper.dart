import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/mocks/staff_mock.dart' show castMovies;
import 'package:flutter_guide_2024/models/people_model.dart';

class CardHorizontalSwiper extends StatefulWidget {
  final Size size;
  String? title;
  Function verMas;
  Function onNext;
  List<People> people = [];

  CardHorizontalSwiper({
    super.key,
    required this.size,
    required this.verMas,
    required this.onNext,
    required this.people,
    this.title,
  });

  @override
  State<CardHorizontalSwiper> createState() => _CardHorizontalSwiperState();
}

class _CardHorizontalSwiperState extends State<CardHorizontalSwiper> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      /* print(
          'posACtual: ${scrollController.position.pixels} posTotal:${scrollController.position.maxScrollExtent}'); */
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNext();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.size.height * 0.40,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(this.widget.title!),
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
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.people.length,
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
                          image: NetworkImage(widget.people[index].image)),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      '${widget.people[index].firstname} ${widget.people[index].lastname}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      widget.people[index].company,
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

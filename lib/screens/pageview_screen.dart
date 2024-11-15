import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  PageViewScreen({super.key});

  final PageController pageController = PageController(
    initialPage: 0,
    //viewportFraction:0.5
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SizedBox(
        width: double.infinity,
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: pageController,
          physics: BouncingScrollPhysics(),
          reverse: false,
          children: [
            Container(
              width: double.infinity,
              color: Colors.red,
              //margin: const EdgeInsets.all(15),
              child: Center(
                  child: TextButton(
                onPressed: () {
                  pageController.jumpToPage(1);
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.red, backgroundColor: Colors.white),
                child: const Text('Siguiente'),
              )),
            ),
            Container(
              width: double.infinity,
              color: Colors.green,
              //margin: const EdgeInsets.all(15),
              child: Center(
                  child: TextButton(
                onPressed: () {
                  pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                    backgroundColor: Colors.white),
                child: const Text('Siguiente'),
              )),
            ),
            Container(
              // margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              color: Colors.blue,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Et magna do non aliquip do ad ea cupidatat irure magna ea est id deserunt. Ut non laborum esse deserunt Lorem proident commodo nisi quis adipisicing quis sunt. Aute laboris non sit proident cillum sint reprehenderit exercitation ea anim. Qui labore pariatur velit enim ullamco fugiat duis laborum ad amet cillum velit qui. Eu ullamco velit irure veniam aliquip aute aute do ut. Occaecat id ea sunt laboris sunt Lorem et nisi duis culpa occaecat ea est esse. Exercitation aliqua occaecat eu ipsum veniam duis est.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 4,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate);
                          },
                          child: const Text('Volver al inicio')))
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

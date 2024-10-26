import 'package:flutter/material.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});


  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    
    return const Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              TituloIcono(),
              PrimerScroll()
            ],
          ),
        ),
      ),
    );
  }
}

class PrimerScroll extends StatelessWidget {
  const PrimerScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 10,
         itemBuilder: (BuildContext context, int index) { 
          return const Card(
          color: Colors.blue,
          
        );
          },
      ),
    );
  }
}

class TituloIcono extends StatelessWidget {
  const TituloIcono({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.all(20.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Mengobrol',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0
              ),
            ),
          Icon(Icons.search)
        ],
      )
    );
  }
}

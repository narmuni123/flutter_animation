import 'package:animation/data/widget_list.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Person person;

  const DetailsPage({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                    color: Colors.transparent,
                    child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(begin: 0.0, end: 1.0).chain(
                            CurveTween(curve: Curves.fastOutSlowIn),
                          ),
                        ),
                        child: toHeroContext.widget));
              case HeroFlightDirection.pop:
                return Material(
                    color: Colors.transparent, child: fromHeroContext.widget);
            }
          },
          tag: person.name,
          child: Text(
            person.emoji,
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              person.name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${person.age} years old",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:animation/animations/horo_animations/details_page.dart';
import 'package:animation/data/widget_list.dart';
import 'package:flutter/material.dart';

class Displace extends StatefulWidget {
  const Displace({Key? key}) : super(key: key);

  @override
  State<Displace> createState() => _DisplaceState();
}

class _DisplaceState extends State<Displace> {
  List<Person> person = const [
    Person(name: "John", age: 20, emoji: "😃"),
    Person(name: "Jane", age: 22, emoji: "😁"),
    Person(name: "Jack", age: 23, emoji: "😂"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
        title: const Text(
          "People",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: person.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    person: person[index],
                  ),
                ),
              );
            },
            leading: Hero(
              tag: person[index].name,
              child: Text(
                person[index].emoji,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            title: Text(
              person[index].name,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "${person[index].age} years",
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

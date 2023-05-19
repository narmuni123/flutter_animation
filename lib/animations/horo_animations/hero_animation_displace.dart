import 'package:animation/data/widget_list.dart';
import 'package:flutter/material.dart';

class Displace extends StatefulWidget {
  const Displace({Key? key}) : super(key: key);

  @override
  State<Displace> createState() => _DisplaceState();
}

class _DisplaceState extends State<Displace> {
  const List<Person> person = [
    Person(name: "John", age: 20, emoji: "😃"),
    Person(name: "Jane", age: 22, emoji: "😁"),
    Person(name: "Jack", age: 23, emoji: "😂"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People"),
      ),
      body: ListView.builder(
        itemCount: person.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, int index) {
          return ListTile(
            leading: Text(person[index].emoji),
            title: Text(person[index].name),
            subtitle: Text("${person[index].age} years"),
          );
        },
      ),
    );
  }
}

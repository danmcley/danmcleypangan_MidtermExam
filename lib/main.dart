import 'package:flutter/material.dart';

void main() {
  runApp(MidtermExamApp());
}

class MidtermExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DanMcleyPangan_MidtermExam'),
        ),
        body: ItemsList(),
      ),
    );
  }
}

class Manga {
  final String name;
  final String details;

  Manga(this.name, this.details);
}

class ItemsList extends StatefulWidget {
  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final List<Manga> items = [
    Manga('Naruto', 'Ninja adventures'),
    Manga('One Piece', 'Pirate journey'),
    Manga('Attack on Titan', 'Humanity vs Titans'),
    Manga('My Hero Academia', 'Superheroes and villains'),
    Manga('Death Note', 'A battle of wits'),
    Manga('Demon Slayer', 'Swordsmanship against demons'),
    Manga('Dragon Ball', 'Fighting and friendship'),
    Manga('Fullmetal Alchemist', 'Alchemy and redemption'),
    Manga('Sword Art Online', 'Virtual reality battles'),
    Manga('Tokyo Ghoul', 'Monsters among us'),
  ];

  List<bool> isAdded = List.filled(10, false);

  void showDetails(int index) {
    print("Details of ${items[index].name}: ${items[index].details}");
  }

  void toggleAdded(int index) {
    setState(() {
      isAdded[index] = !isAdded[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: isAdded[index] ? Colors.green[200] : Colors.white,
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    items[index].name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => showDetails(index),
                      child: const Text('Details'),
                    ),
                    const SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () => toggleAdded(index),
                      child: Text(isAdded[index] ? 'Added' : 'Add'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
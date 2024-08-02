import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int gridSize = 3; // 3x3 grid
  List<Color?> boxColors = [];
  int penalties = 0;
  int wins = 0;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    boxColors = List.generate(gridSize * gridSize, (index) => null);
  }

  void _revealBox(int index) {
    setState(() {
      if (boxColors[index] == null) {
        Color newColor = Random().nextBool() ? Colors.red : Colors.black;
        boxColors[index] = newColor;
        if (newColor == Colors.black) {
          penalties++;
          _updateFirebase("penalties");
        } else {
          wins++;
          _updateFirebase("wins");
        }
      }
    });
  }

  void _updateFirebase(String resultType) async {
    CollectionReference results = FirebaseFirestore.instance.collection('results');
    await results.add({
      'resultType': resultType,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Gambling Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridSize,
            ),
            itemCount: gridSize * gridSize,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _revealBox(index),
                child: Container(
                  margin: EdgeInsets.all(4.0),
                  color: boxColors[index] ?? Colors.grey,
                  height: 100,
                  width: 100,
                  child: boxColors[index] == null
                      ? Center(child: Text('?'))
                      : null,
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Text(
            'Penalties: $penalties',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Wins: $wins',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                penalties = 0;
                wins = 0;
                _initializeGame();
              });
            },
            child: Text('Restart Game'),
          ),
        ],
      ),
    );
  }
}

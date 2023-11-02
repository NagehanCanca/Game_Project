import 'dart:async';

import 'package:flutter/material.dart';
import '../../../constants/consts.dart';
import 'game_screen.dart';

class QuestScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<Map<String, String>> imageList;
  final int currentIndex;

  QuestScreen({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.imageList,
    required this.currentIndex,
  });

  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (_offset < 1.0) {
        setState(() {
          _offset += 0.1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Transform.translate(
                    offset: Offset(0, 100 * (1 - _offset)), // Metinlerin yukarı kaymasını sağlayan offset
                    child: Text(
                      widget.imageList[widget.currentIndex]["questText"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, 100 * (1 - _offset)),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GameScreen(
                              imagePath: widget.imagePath,
                              title: widget.title,
                              description: widget.description,
                            ),
                          ),
                        );
                      },
                      child: const Text("Başla"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

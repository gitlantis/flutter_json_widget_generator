import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // 3
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset('assets/books.png'),
          ),
        ),
      ]),
    );
  }
}

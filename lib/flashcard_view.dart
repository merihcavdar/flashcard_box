import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  final String text;
  final Widget iconFlag;
  const FlashCardView({super.key, required this.text, required this.iconFlag});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      child: Center(
        child: ListTile(
          leading: iconFlag,
          title: Text(
            text,
            style: const TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

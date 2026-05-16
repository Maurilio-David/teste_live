import 'package:flutter/material.dart';

class PageErrorWidget extends StatelessWidget {
  const PageErrorWidget({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, size: 100),
        Text(message, style: TextStyle(fontSize: 24)),
      ],
    );
  }
}

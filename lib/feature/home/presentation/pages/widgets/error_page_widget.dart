import 'package:flutter/material.dart';

class PageErrorWidget extends StatelessWidget {
  const PageErrorWidget({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message));
  }
}

import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:teste_live/feature/episodes/presentation/pages/widgets/character_tile.dart';

class PageLoadingWidget extends StatelessWidget {
  const PageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (_, index) {
          return ListTile(
            leading: const CircleAvatar(radius: 28),
            title: Container(height: 16, color: Colors.white),
          );
        },
      ),
    );
  }
}

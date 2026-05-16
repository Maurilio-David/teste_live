import 'package:flutter/material.dart';
import 'package:teste_live/feature/home/domain/entities/character_entity.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({required this.character, super.key});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(character.image),
      ),
      title: Text(character.name, style: TextStyle(fontSize: 20)),
    );
  }
}

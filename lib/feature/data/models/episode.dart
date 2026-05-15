import 'package:teste_live/feature/data/models/characters.dart';

class Episode {
  final String id;
  final String name;
  final String airDate;
  final List<Characters> characters;
  final String url;
  final String created;

  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.characters,
    required this.url,
    required this.created,
  });
}

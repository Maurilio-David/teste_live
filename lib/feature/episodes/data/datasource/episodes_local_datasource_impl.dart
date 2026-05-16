import 'package:sqflite/sqflite.dart';
import 'package:teste_live/core/database/app_database.dart';
import 'package:teste_live/core/database/tables/characters.dart';
import 'package:teste_live/core/database/tables/episode.dart';
import 'package:teste_live/feature/episodes/data/datasource/episodes_local_datasource.dart';
import 'package:teste_live/feature/episodes/data/models/characters_model.dart';
import 'package:teste_live/feature/episodes/data/models/episode_model.dart';

class EpisodesLocalDatasourceImpl implements EpisodesLocalDatasource {
  final AppDatabase database;

  EpisodesLocalDatasourceImpl(this.database);

  @override
  Future<void> saveEpisode(EpisodeModel episode) async {
    final db = await AppDatabase.instance;

    await db.insert(episodeTableName, {
      episodeTableId: episode.id,
      episodeTableNameColumn: episode.name,
    }, conflictAlgorithm: ConflictAlgorithm.replace);

    final batch = db.batch();

    for (final character in episode.characters) {
      batch.insert(characterTableName, {
        characterTableId: character.id,

        characterTableEpisodeId: episode.id,

        characterTableNameColumn: character.name,

        characterTableImage: character.image,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }

  @override
  Future<EpisodeModel?> getEpisode(int id) async {
    final db = await AppDatabase.instance;

    final episodeResult = await db.query(
      episodeTableName,
      where: '$episodeTableId = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (episodeResult.isEmpty) {
      return null;
    }

    final episodeMap = episodeResult.first;

    final charactersResult = await db.query(
      characterTableName,
      where: '$characterTableEpisodeId = ?',
      whereArgs: [id],
    );

    final characters =
        charactersResult.map((e) {
          return CharacterModel(
            id: e[characterTableId] as int,
            name: e[characterTableNameColumn] as String,
            image: e[characterTableImage] as String,
          );
        }).toList();

    return EpisodeModel(
      id: episodeMap[episodeTableId] as int,

      name: episodeMap[episodeTableNameColumn] as String,

      characters: characters,
    );
  }

  @override
  Future<List<EpisodeModel>> getEpisodesHistory() async {
    final db = await AppDatabase.instance;

    final episodesResult = await db.query(
      episodeTableName,
      orderBy: '$episodeTableId DESC',
    );

    List<EpisodeModel> episodes = [];

    for (final episodeMap in episodesResult) {
      final episodeId = episodeMap[episodeTableId] as int;

      final charactersResult = await db.query(
        characterTableName,
        where: '$characterTableEpisodeId = ?',
        whereArgs: [episodeId],
      );

      final characters =
          charactersResult.map((e) {
            return CharacterModel(
              id: e[characterTableId] as int,
              name: e[characterTableNameColumn] as String,
              image: e[characterTableImage] as String,
            );
          }).toList();

      episodes.add(
        EpisodeModel(
          id: episodeId,
          name: episodeMap[episodeTableNameColumn] as String,
          characters: characters,
        ),
      );
    }

    return episodes;
  }
}

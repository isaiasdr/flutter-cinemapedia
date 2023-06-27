

import 'package:cinemapedia/domain/datasources/actors_datasouce.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository {

  final ActorsDatasource dataSource;
  ActorsRepositoryImpl(this.dataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return dataSource.getActorsByMovie(movieId);
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/infraestructure/datasources/theMovieDB/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/actor_repository_impl.dart';

//inmutable
final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(ActorMovieDbDatasource());
});
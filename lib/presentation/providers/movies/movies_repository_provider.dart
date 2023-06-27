import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/infraestructure/datasources/theMovieDB/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';

//inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MovieDbDatasource());
});
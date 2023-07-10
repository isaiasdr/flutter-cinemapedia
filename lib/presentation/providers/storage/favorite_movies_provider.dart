import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

final favoriesMoviesProvider = StateNotifierProvider<StorageMoviesNotfier, Map<int, Movie>>((ref) {

  final localStorageRepository = ref.watch( localStorageRepositoryProvider );

  return StorageMoviesNotfier( localStorageRepository: localStorageRepository );
});

class StorageMoviesNotfier extends StateNotifier<Map<int, Movie>> {

  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotfier({
    required this.localStorageRepository
  }): super({});

  Future<List<Movie>> loadNextPage() async {

    int limit = 12;

    final movies = await localStorageRepository.loadMovies(offset: page * limit, limit: limit);
    page++;

    final tempMovieMap = <int, Movie>{};
    for ( final movie in movies ) {
      tempMovieMap[movie.id] = movie;
    }

    state = { ...state, ...tempMovieMap };

    return movies;
  }

  Future<void> toggleFavorite( Movie movie ) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = await localStorageRepository.isMovieFavorite(movie.id);

    if( !isMovieInFavorites ) {
      state.remove(movie.id);
      state = { ...state };
    } else {
      state = { ...state, movie.id: movie };
    }
  }
}
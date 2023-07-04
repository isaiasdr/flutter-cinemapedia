

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie movieDBToEntity( MovieMovieDB moviedb ) => Movie(
    adult: moviedb.adult, 
    backdropPath: moviedb.backdropPath != '' 
      ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }' 
      : 'https://ih1.redbubble.net/image.1027712254.9762/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg', 
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(), 
    id: moviedb.id, 
    originalLanguage: moviedb.originalLanguage, 
    originalTitle: moviedb.originalTitle, 
    overview: moviedb.overview, 
    popularity: moviedb.popularity, 
    posterPath: moviedb.posterPath != ''
      ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }' 
      : 'https://lascrucesfilmfest.com/wp-content/uploads/2018/01/no-poster-available-737x1024.jpg',
    releaseDate: moviedb.releaseDate, 
    title: moviedb.title, 
    video: moviedb.video, 
    voteAverage: moviedb.voteAverage, 
    voteCount: moviedb.voteCount
  );

  static Movie movieDetailsToEntity ( MovieDetails moviedb ) => Movie(
    adult: moviedb.adult, 
    backdropPath: moviedb.backdropPath != '' 
      ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }' 
      : 'https://ih1.redbubble.net/image.1027712254.9762/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg', 
    genreIds: moviedb.genres.map((e) => e.name).toList(), 
    id: moviedb.id, 
    originalLanguage: moviedb.originalLanguage, 
    originalTitle: moviedb.originalTitle, 
    overview: moviedb.overview, 
    popularity: moviedb.popularity, 
    posterPath: moviedb.posterPath != ''
      ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }' 
      : 'https://lascrucesfilmfest.com/wp-content/uploads/2018/01/no-poster-available-737x1024.jpg',
    releaseDate: moviedb.releaseDate, 
    title: moviedb.title, 
    video: moviedb.video, 
    voteAverage: moviedb.voteAverage, 
    voteCount: moviedb.voteCount
  );
}
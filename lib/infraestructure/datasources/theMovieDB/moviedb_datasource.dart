import 'package:cinemapedia/infraestructure/datasources/theMovieDB/constants.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';

import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieDbDatasource extends MoviesDataSource {
  
  List<Movie> _jsonToMovies( Map<String, dynamic> json ) {

    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
      .where((moviedb) => moviedb.posterPath != 'no-poster')
      .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
      .toList();
    
    return movies;
  }

  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', 
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async{
    final response = await dio.get('/movie/top_rated', 
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async{
    final response = await dio.get('/movie/upcoming', 
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if ( response.statusCode != 200 ) throw Exception('Movue with id: $id not found');

    final moviedbDetails = MovieDetails.fromJson( response.data );

    final Movie movie = MovieMapper.movieDetailsToEntity(moviedbDetails);

    return movie;
  }
}
import 'package:cinemapedia/domain/datasources/actors_datasouce.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/datasources/theMovieDB/constants.dart';
import 'package:cinemapedia/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    
    final response = await dio.get('/movie/$movieId/credits');
    
    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast
      .map( (cast) => ActorMapper.castToEntity(cast) )
      .toList();

    return actors;
  }
}
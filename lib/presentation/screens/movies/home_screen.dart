import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final noewPlayingMovies = ref.watch( nowPlayingMoviesProvider );

    if( noewPlayingMovies.isEmpty ) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } 

    return ListView.builder(
      itemCount: noewPlayingMovies.length,
      itemBuilder: (context, index) {
        final movie = noewPlayingMovies[index];
        return ListTile(
          title: Text(movie.title),

        );
      },
    );
  }
}
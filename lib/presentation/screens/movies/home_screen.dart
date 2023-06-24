import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigation(),
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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);

    if( initialLoading ) return const FullScreenLoader();
    
    final slideShowMovies = ref.watch( moviesSlideshowProvider );

    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );

    if( slideShowMovies.isEmpty ) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } 

    return CustomScrollView(

      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: CustomAppbar(),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
              children: [    
                MoviesSlideshow(movies: slideShowMovies),
          
                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'In Theaters',
                  subTitle: 'Monday 20',
                  loadNextPage: () => ref.watch(nowPlayingMoviesProvider.notifier).loadNextPage(),
                ),
          
                MovieHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Upcoming',
                  subTitle: 'This month',
                  loadNextPage: () => ref.watch(upcomingMoviesProvider.notifier).loadNextPage(),
                ),

                MovieHorizontalListView(
                  movies: popularMovies,
                  title: 'Popular',
                  loadNextPage: () => ref.watch(popularMoviesProvider.notifier).loadNextPage(),
                ),
          
                MovieHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Best Rated',
                  subTitle: 'Of all times',
                  loadNextPage: () => ref.watch(topRatedMoviesProvider.notifier).loadNextPage(),
                ),

                const SizedBox(height: 10)
              ],
            );
          },
          childCount: 1
        )
        )
      ]
    );
  }
}
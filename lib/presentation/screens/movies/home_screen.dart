import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';
  final int pageIndex;

  final viewRoutes = const <Widget>[
    HomeView(),
    CategoriesView(),
    FavoritesView(),
  ];

  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottonNavigation(currentIndex: pageIndex),
    );
  }
}
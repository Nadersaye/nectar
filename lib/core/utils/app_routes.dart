import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/presentation/views/screens/splash_view.dart';

abstract class AppRoutes {
  static const String homeView = '/homeView';
  static const String bookDetailsView = '/ProductDetailsView';
  static const String searchView = '/SearchView';
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      /*GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            ),
          );
        },
      ),
      GoRoute(
        path: searchView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SearchResultCubit(getIt.get<SearchRepoImp>()),
            child: const SearchView(),
          );
        },
      ),*/
    ],
  );
}

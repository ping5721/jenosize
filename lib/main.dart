import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jenosize/bloc/restaurant_bloc.dart';
import 'package:jenosize/pages/landing_page.dart';
import 'package:jenosize/pages/map_page.dart';
import 'package:jenosize/pages/search_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jenosize/repository/restaurant_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void main() {
  runApp(const JenosizeDemo());
}

class JenosizeDemo extends StatelessWidget {
  const JenosizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jenosize Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        final BaseOptions baseOptions = BaseOptions(
          baseUrl: 'https://64305935c26d69edc8903021.mockapi.io',
        );
        final Dio dio = Dio(baseOptions);
        dio.interceptors.add(PrettyDioLogger());

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) {
                return const LandingPage();
              },
            );
          case '/search':
            return MaterialPageRoute(
              builder: (context) {
                return RepositoryProvider(
                  create: (context) => RestaranRepository(dio),
                  child: BlocProvider(
                    create: (context) => RestaurantBloc(
                      context.read<RestaranRepository>(),
                    )..add(RestarantStarted()),
                    child: const SearchPage(),
                  ),
                );
              },
            );
          case '/map':
            return MaterialPageRoute(
              builder: (context) {
                return const MapPage();
              },
            );
        }
        return null;
      },
      initialRoute: '/',
    );
  }
}

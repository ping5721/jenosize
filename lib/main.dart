import 'package:flutter/material.dart';
import 'package:jenosize/pages/landing_page.dart';
import 'package:jenosize/pages/map_page.dart';
import 'package:jenosize/pages/search_page.dart';

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
                return const SearchPage();
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

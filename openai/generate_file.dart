import 'package:flutter/material.dart';
import 'package:recipe_app/openai/home_page_1.dart';

class RouteGenerator{
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomePage4()); // MaterialPageRoute
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ), // AppBar
        body: const Center(
          child: Text('ERROR'),
        ), // Center
      ); // Scaffold
    }); // MaterialPageRoute

  }
}
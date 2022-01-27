
import 'package:flutter/material.dart';
import 'modules/chuck_norris/pages/categories/categories_page.dart';
import 'modules/chuck_norris/pages/joke/joke_page.dart';
import 'modules/todo/todo_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      '/': (context) => CategoriesPage(),
      '/joke': (context) =>
          JokePage(category: settings.arguments as String),
      '/todo': (context) => TodoPage()
    };

    WidgetBuilder? builder = routes[settings.name!];
    return MaterialPageRoute(
        builder: (ctx) => builder!(ctx), settings: settings);
  }
}

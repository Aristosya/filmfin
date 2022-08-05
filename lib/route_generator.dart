import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'feature/domain/entities/people_entity.dart';
import 'feature/presentation/pages/films_detail_view.dart';
import 'feature/presentation/pages/films_list_page.dart';
import 'feature/presentation/pages/people_list_page.dart';
import 'feature/presentation/pages/error_page.dart';
import 'feature/presentation/pages/people_detail_view.dart';
import 'generated/l10n.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(dynamic settings) {
      switch (settings.name) {
        case PeopleListPage.routeName:
          return MaterialPageRoute(builder: (context) => PeopleListPage());
        case PeopleDetailViewPage.routeName:
          return MaterialPageRoute(builder: (context) => PeopleDetailViewPage(), settings: settings);
        case FilmsListPage.routeName:
          return MaterialPageRoute(builder: (context) => FilmsListPage());
        case FilmsDetailViewPage.routeName:
          return MaterialPageRoute(builder: (context) => FilmsDetailViewPage(), settings: settings);
        default:
          return MaterialPageRoute(builder: (context) => ErrorPage(),);
      }
  }
}

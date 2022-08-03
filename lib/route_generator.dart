import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'feature/domain/entities/people_entity.dart';
import 'feature/presentation/pages/home_page.dart';
import 'feature/presentation/pages/error_page.dart';
import 'feature/presentation/pages/people_detail_view.dart';
import 'generated/l10n.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(dynamic settings) {
      switch (settings.name) {
        case HomePage.routeName:
          return MaterialPageRoute(builder: (context) => HomePage());
        case PeopleDetailViewPage.routeName:
          return MaterialPageRoute(builder: (context) => PeopleDetailViewPage(), settings: settings);
        default:
          return MaterialPageRoute(builder: (context) => ErrorPage(),);
      }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../widgets/app_bar.dart';
import '../widgets/films_list_widget.dart';
import '../widgets/search_delegates.dart';
import '../widgets/people_list_widget.dart';




class FilmsListPage extends StatelessWidget {
  const FilmsListPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/films';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars().films(title: '${S.of(context).films_list_page_title}', context: context),
      body: FilmsList(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../widgets/app_bar.dart';
import '../widgets/search_delegates.dart';
import '../widgets/people_list_widget.dart';




class PeopleListPage extends StatelessWidget {
  const PeopleListPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars().characters(title: '${S.of(context).people_list_page_title}', context: context),

      body: PeopleList(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

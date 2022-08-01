import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../widgets/custom_search_delegate.dart';
import '../widgets/people_list_widget.dart';




class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home_page_title),
        actions: [
          IconButton(onPressed: () { showSearch(context: context, delegate: CustomSearchDelegate(context),);},
              icon: Icon(Icons.search))
        ],
      ),
      body: PeopleList(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

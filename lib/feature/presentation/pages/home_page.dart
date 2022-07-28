import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/people_list_widget.dart';




class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PeopleList(),
    );
  }
}

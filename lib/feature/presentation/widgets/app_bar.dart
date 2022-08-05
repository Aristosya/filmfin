import 'package:flutter/material.dart';
import 'package:untitled/feature/presentation/pages/people_list_page.dart';

import '../pages/films_list_page.dart';
import 'search_delegates.dart';

class AppBars {
  AppBar characters({title = '', required context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: CustomPopup(title: title,widthTitle: 132),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {
          showSearch(context: context,
            delegate: CharactersSearchDelegate(context: context),);
        },
            icon: Icon(Icons.search))
      ],
    );
  }

  AppBar films({title = '', required context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: CustomPopup(title: title,widthTitle: 54+22),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {
          showSearch(context: context,
            delegate: FilmsSearchDelegate(context: context),);
        },
            icon: Icon(Icons.search))
      ],
    );
  }
}

class CustomPopup extends StatelessWidget {
  final String title;
  final double widthTitle;
  CustomPopup({
    Key? key,required this.title, required this.widthTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      iconSize: widthTitle,
      icon: Row(
        children: [
          Text(title),
          SizedBox(width: 10,),
          Icon(Icons.arrow_drop_down,size: 15,),
        ],
      ),
      onSelected: (String result) {
        switch (result) {
          case 'Characters':
            Navigator.pushNamed(context, PeopleListPage.routeName);
            break;
          case 'Films':
            Navigator.pushNamed(context, FilmsListPage.routeName);
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Characters',
          child: ListTile(
            title: Text('Characters'),
            trailing: Icon(Icons.account_box_outlined),

          ),
        ),
        const PopupMenuItem<String>(
          value: 'Films',
          child: ListTile(
            title: Text('Films'),
            trailing: Icon(Icons.video_collection),
          ),
        ),
      ],
    );
  }
}
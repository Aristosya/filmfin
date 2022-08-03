import 'package:flutter/material.dart';
import 'package:untitled/feature/domain/entities/people_entity.dart';

import '../../../generated/l10n.dart';
import '../pages/error_page.dart';
import '../pages/people_detail_view.dart';

class PeopleCardBrief extends StatelessWidget {
  final PeopleEntity character;
  final int index;
  const PeopleCardBrief({Key? key,required this.character, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Navigator.of(context).pushNamed(PeopleDetailViewPage.routeName, arguments : {'character': character},)},
      child: Ink(
        color: ((){
          if (index%2 == 0){return Theme.of(context).cardColor;}
          else {
            return Theme.of(context).unselectedWidgetColor;
          }
        }()),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${character.name}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,overflow: TextOverflow.ellipsis),),
            Text('${S.of(context).gender}${character.gender}', style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
            Text('${S.of(context).birth_year}${character.birth_year}', style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
            Text('${S.of(context).height}${character.height}', style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
            Text('${S.of(context).created}${character.created?.year}', style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
          ],
        ),
      ),

    );
  }
}


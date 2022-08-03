import 'package:flutter/material.dart';
import 'package:untitled/feature/domain/entities/people_entity.dart';

import '../../../common/styles.dart';
import '../../../generated/l10n.dart';

class PeopleDetailViewPage extends StatelessWidget {
  static const routeName = 'people/detail';
  PeopleDetailViewPage({Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments) as Map;
    final character = args['character'];

    return Scaffold(
      appBar: AppBar(title: Text('${S.of(context).people_detail_view_page_title}')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${character.name}', style: ThemeText.infoHeader,),
                  Text('${S.of(context).gender}${character.gender}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).birth_year}${character.birth_year}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).height}${character.height}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).created}${character.created?.year}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).hair_color}${character.hair_color}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).skin_color}${character.skin_color}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).eye_color}${character.eye_color}', style: ThemeText.infoMedium,),
                  Divider(height: 4,color: Theme.of(context).dividerColor,),
                  Text('${S.of(context).api_info}', style: ThemeText.infoHeader,),
                  Text('${S.of(context).films}${character.films}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).vehicles}${character.vehicles}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).starships}${character.starships}', style: ThemeText.infoMedium,),
                  Text('${S.of(context).url}${character.url}', style: ThemeText.infoMedium.copyWith(overflow: TextOverflow.visible,),),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

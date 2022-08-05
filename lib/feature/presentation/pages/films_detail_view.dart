import 'package:flutter/material.dart';
import 'package:untitled/feature/domain/entities/films_entity.dart';
import 'package:untitled/feature/domain/entities/people_entity.dart';

import '../../../common/styles.dart';
import '../../../generated/l10n.dart';

class FilmsDetailViewPage extends StatelessWidget {
  static const routeName = 'films/detail';
  FilmsDetailViewPage({Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments) as Map;
    final FilmsEntity films = args['films'];

    return Scaffold(
      appBar: AppBar(title: Text('${S.of(context).detail_view_page_title}')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${films.title}', style: ThemeText.infoHeader,),
                    Text('${S.of(context).episode_id}${films.episode_id}', style: ThemeText.infoMedium,),
                    Text('${S.of(context).opening_crawl}${films.opening_crawl}', style: ThemeText.infoMedium.copyWith(overflow: TextOverflow.visible,),),
                    Text('${S.of(context).director}${films.director}', style: ThemeText.infoMedium.copyWith(overflow: TextOverflow.visible,),),
                    Text('${S.of(context).producer}${films.producer}', style: ThemeText.infoMedium.copyWith(overflow: TextOverflow.visible,),),
                    Text('${S.of(context).release_date}${films.release_date?.year}', style: ThemeText.infoMedium,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

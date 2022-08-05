import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../domain/entities/films_entity.dart';
import '../pages/films_detail_view.dart';

class FilmsCardBrief extends StatelessWidget {
  final FilmsEntity film;
  final int index;
  const FilmsCardBrief({Key? key,required this.film, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Navigator.of(context).pushNamed(FilmsDetailViewPage.routeName, arguments : {'films': film},)},
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
            Text('${film.title}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,overflow: TextOverflow.ellipsis),),
            Text('${S.of(context).episode_id}${film.episode_id}', style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
            Text('${S.of(context).release_date}${film.release_date?.year}', style: TextStyle(fontSize: 20,overflow: TextOverflow.ellipsis),),
          ],
        ),
      ),

    );
  }
}


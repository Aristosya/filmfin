import 'package:flutter/material.dart';
import '../../domain/entities/films_entity.dart';
import '../../domain/entities/people_entity.dart';
import '../pages/films_detail_view.dart';
import '../pages/people_detail_view.dart';

class PeopleSearchResult extends StatelessWidget {
  final PeopleEntity peopleResult;

  const PeopleSearchResult({Key? key, required this.peopleResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(PeopleDetailViewPage.routeName, arguments : {'character': peopleResult},);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${peopleResult.name}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${peopleResult.created?.year}/${peopleResult.created?.month}/${peopleResult.created?.day}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilmsSearchResult extends StatelessWidget {
  final FilmsEntity filmsResult;

  const FilmsSearchResult({Key? key, required this.filmsResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(FilmsDetailViewPage.routeName, arguments : {'films': filmsResult},);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${filmsResult.title}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${filmsResult.release_date?.year}/${filmsResult.release_date?.month}/${filmsResult.release_date?.day}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
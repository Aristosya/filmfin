import 'package:flutter/material.dart';
import 'package:untitled/feature/domain/entities/people_entity.dart';

class ErrorPage extends StatelessWidget {
  static const routeName = '/error';
  ErrorPage({Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Wrong Route!')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: Text('Error page',)),
      ),
    );
  }
}

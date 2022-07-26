import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:untitled/feature/presentation/bloc/people_list_cubit/people_list_cubit.dart';
import 'package:untitled/feature/presentation/bloc/people_search_bloc/people_search_bloc.dart';
import 'package:untitled/locator_service.dart' as di;
import 'common/theme.dart';
import 'feature/presentation/bloc/films_list_cubit/films_list_cubit.dart';
import 'feature/presentation/bloc/films_search_bloc/films_search_bloc.dart';
import 'generated/l10n.dart';
import 'locator_service.dart';
import 'route_generator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PeopleListCubit>(create: (context) => sl<PeopleListCubit>()..loadPeople(),),
        BlocProvider<PeopleSearchBloc>(create: (context) => sl<PeopleSearchBloc>()),
        BlocProvider<FilmsListCubit>(create: (context) => sl<FilmsListCubit>()..loadFilms(),),
        BlocProvider<FilmsSearchBloc>(create: (context) => sl<FilmsSearchBloc>()),
      ],
      child: AdaptiveTheme(
        initial: AdaptiveThemeMode.light,
        light: lightTheme,
        dark: darkTheme,
        builder: (light,dark) => MaterialApp(
          theme: light,
          darkTheme: dark,
          onGenerateRoute: RouteGenerator.generateRoute,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
  }
}

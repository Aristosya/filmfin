// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Characters`
  String get home_page_title {
    return Intl.message(
      'Characters',
      name: 'home_page_title',
      desc: '',
      args: [],
    );
  }

  /// `More information`
  String get people_detail_view_page_title {
    return Intl.message(
      'More information',
      name: 'people_detail_view_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Gender: `
  String get gender {
    return Intl.message(
      'Gender: ',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Birth year: `
  String get birth_year {
    return Intl.message(
      'Birth year: ',
      name: 'birth_year',
      desc: '',
      args: [],
    );
  }

  /// `Height: `
  String get height {
    return Intl.message(
      'Height: ',
      name: 'height',
      desc: '',
      args: [],
    );
  }

  /// `Created year: `
  String get created {
    return Intl.message(
      'Created year: ',
      name: 'created',
      desc: '',
      args: [],
    );
  }

  /// `Hair color: `
  String get hair_color {
    return Intl.message(
      'Hair color: ',
      name: 'hair_color',
      desc: '',
      args: [],
    );
  }

  /// `Mass: `
  String get mass {
    return Intl.message(
      'Mass: ',
      name: 'mass',
      desc: '',
      args: [],
    );
  }

  /// `Skin color: `
  String get skin_color {
    return Intl.message(
      'Skin color: ',
      name: 'skin_color',
      desc: '',
      args: [],
    );
  }

  /// `Eye color: `
  String get eye_color {
    return Intl.message(
      'Eye color: ',
      name: 'eye_color',
      desc: '',
      args: [],
    );
  }

  /// `Films: `
  String get films {
    return Intl.message(
      'Films: ',
      name: 'films',
      desc: '',
      args: [],
    );
  }

  /// `Vehicles: `
  String get vehicles {
    return Intl.message(
      'Vehicles: ',
      name: 'vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Starships: `
  String get starships {
    return Intl.message(
      'Starships: ',
      name: 'starships',
      desc: '',
      args: [],
    );
  }

  /// `Url: `
  String get url {
    return Intl.message(
      'Url: ',
      name: 'url',
      desc: '',
      args: [],
    );
  }

  /// `API information: `
  String get api_info {
    return Intl.message(
      'API information: ',
      name: 'api_info',
      desc: '',
      args: [],
    );
  }

  /// `Seacrh character: `
  String get search_character {
    return Intl.message(
      'Seacrh character: ',
      name: 'search_character',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

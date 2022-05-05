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

  /// `Add new record`
  String get addRecord {
    return Intl.message(
      'Add new record',
      name: 'addRecord',
      desc: '',
      args: [],
    );
  }

  /// `Describe your task here...`
  String get descibeTask {
    return Intl.message(
      'Describe your task here...',
      name: 'descibeTask',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get createTask {
    return Intl.message(
      'Create',
      name: 'createTask',
      desc: '',
      args: [],
    );
  }

  /// `No Tasks`
  String get noTasks {
    return Intl.message(
      'No Tasks',
      name: 'noTasks',
      desc: '',
      args: [],
    );
  }

  /// `Edit your record`
  String get editTitle {
    return Intl.message(
      'Edit your record',
      name: 'editTitle',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get durationTitle {
    return Intl.message(
      'Duration',
      name: 'durationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Is submitted`
  String get submittedTitle {
    return Intl.message(
      'Is submitted',
      name: 'submittedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelTitle {
    return Intl.message(
      'Cancel',
      name: 'cancelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveTitle {
    return Intl.message(
      'Save',
      name: 'saveTitle',
      desc: '',
      args: [],
    );
  }
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

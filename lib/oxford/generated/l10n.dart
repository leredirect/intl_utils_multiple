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

class OxfordDictionaryS extends S {
  OxfordDictionaryS();

  static OxfordDictionaryS? _current;

  static OxfordDictionaryS get current {
    assert(_current != null,
        'No instance of OxfordDictionaryS was loaded. Try to initialize the OxfordDictionaryS delegate before accessing OxfordDictionaryS.current.');
    return _current!;
  }

  static const OxfordDictionarySDelegate delegate = OxfordDictionarySDelegate();

  static Future<OxfordDictionaryS> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = OxfordDictionaryS();
      OxfordDictionaryS._current = instance;

      return instance;
    });
  }

  static OxfordDictionaryS of(BuildContext context) {
    final instance = OxfordDictionaryS.maybeOf(context);
    assert(instance != null,
        'No instance of OxfordDictionaryS present in the widget tree. Did you add OxfordDictionaryS.delegate in localizationsDelegates?');
    return instance!;
  }

  static OxfordDictionaryS? maybeOf(BuildContext context) {
    return Localizations.of<OxfordDictionaryS>(context, OxfordDictionaryS);
  }

  /// `hello`
  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `hey`
  String get hey {
    return Intl.message(
      'hey',
      name: 'hey',
      desc: '',
      args: [],
    );
  }
}

enum OxfordDictionarySNames {
  hello,
  hey
}

class OxfordDictionarySDelegate
    extends LocalizationsDelegate<OxfordDictionaryS> {
  const OxfordDictionarySDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<OxfordDictionaryS> load(Locale locale) =>
      OxfordDictionaryS.load(locale);
  @override
  bool shouldReload(OxfordDictionarySDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

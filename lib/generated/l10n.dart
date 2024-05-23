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

  /// `Good Morning`
  String get goodMorning {
    return Intl.message(
      'Good Morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message(
      'Sunrise',
      name: 'sunrise',
      desc: '',
      args: [],
    );
  }

  /// `Sunset`
  String get sunset {
    return Intl.message(
      'Sunset',
      name: 'sunset',
      desc: '',
      args: [],
    );
  }

  /// `Mist`
  String get mist {
    return Intl.message(
      'Mist',
      name: 'mist',
      desc: '',
      args: [],
    );
  }

  /// `Smoke`
  String get smoke {
    return Intl.message(
      'Smoke',
      name: 'smoke',
      desc: '',
      args: [],
    );
  }

  /// `Haze`
  String get haze {
    return Intl.message(
      'Haze',
      name: 'haze',
      desc: '',
      args: [],
    );
  }

  /// `Dust`
  String get dust {
    return Intl.message(
      'Dust',
      name: 'dust',
      desc: '',
      args: [],
    );
  }

  /// `Fog`
  String get fog {
    return Intl.message(
      'Fog',
      name: 'fog',
      desc: '',
      args: [],
    );
  }

  /// `Sand`
  String get sand {
    return Intl.message(
      'Sand',
      name: 'sand',
      desc: '',
      args: [],
    );
  }

  /// `Ash`
  String get ash {
    return Intl.message(
      'Ash',
      name: 'ash',
      desc: '',
      args: [],
    );
  }

  /// `Squall`
  String get squall {
    return Intl.message(
      'Squall',
      name: 'squall',
      desc: '',
      args: [],
    );
  }

  /// `Tornado`
  String get tornado {
    return Intl.message(
      'Tornado',
      name: 'tornado',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Clouds`
  String get clouds {
    return Intl.message(
      'Clouds',
      name: 'clouds',
      desc: '',
      args: [],
    );
  }

  /// `Snow`
  String get snow {
    return Intl.message(
      'Snow',
      name: 'snow',
      desc: '',
      args: [],
    );
  }

  /// `Rain`
  String get rain {
    return Intl.message(
      'Rain',
      name: 'rain',
      desc: '',
      args: [],
    );
  }

  /// `Drizzle`
  String get drizzle {
    return Intl.message(
      'Drizzle',
      name: 'drizzle',
      desc: '',
      args: [],
    );
  }

  /// `Thunderstorm`
  String get thunderstorm {
    return Intl.message(
      'Thunderstorm',
      name: 'thunderstorm',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good afternoon',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good evening`
  String get goodEvening {
    return Intl.message(
      'Good evening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `Good night`
  String get goodNight {
    return Intl.message(
      'Good night',
      name: 'goodNight',
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
      Locale.fromSubtags(languageCode: 'ru'),
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

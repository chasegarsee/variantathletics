import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'th'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? thText = '',
  }) =>
      [enText, thText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // exerciseLibrary
  {
    'rvjg82nr': {
      'en': 'VARIANT',
      'th': '',
    },
    'ejd07cee': {
      'en': 'All Exercises',
      'th': '',
    },
    'u9wjmho0': {
      'en': 'All Exercises',
      'th': '',
    },
    '44ij5tx8': {
      'en': 'Abs',
      'th': '',
    },
    '3f4afs6a': {
      'en': 'Back',
      'th': '',
    },
    '58goy4zg': {
      'en': 'Calves',
      'th': '',
    },
    'zpg5stbe': {
      'en': 'Chest',
      'th': '',
    },
    'ggw0bng7': {
      'en': 'Forearms',
      'th': '',
    },
    '145pd5mr': {
      'en': 'Glutes',
      'th': '',
    },
    'lv7xy9kv': {
      'en': 'Hamstrings',
      'th': '',
    },
    '8bwv5aab': {
      'en': 'Lower Back',
      'th': '',
    },
    'byi6yjzv': {
      'en': 'Quads',
      'th': '',
    },
    '4w2g3ffe': {
      'en': 'Shoulders',
      'th': '',
    },
    'q8yqmugf': {
      'en': 'Traps',
      'th': '',
    },
    'udzwh0x4': {
      'en': 'Triceps',
      'th': '',
    },
    '39l0b3ne': {
      'en': 'Please select...',
      'th': '',
    },
    'qr8kspru': {
      'en': 'Search for target muscle group',
      'th': '',
    },
    'd2nwpzvd': {
      'en': 'Timer',
      'th': '',
    },
    '30zndnrx': {
      'en': 'library',
      'th': '',
    },
  },
  // exercise
  {
    'r5tuw15s': {
      'en': 'Home',
      'th': '',
    },
  },
  // timer
  {
    'cwfm3jpz': {
      'en': 'Sets',
      'th': '',
    },
    'kmnfcmrh': {
      'en': 'Working Interval',
      'th': '',
    },
    'vnkpip5l': {
      'en': '0:10',
      'th': '',
    },
    'ogvpf1sh': {
      'en': '0:15',
      'th': '',
    },
    'uhgjokn5': {
      'en': '0:20',
      'th': '',
    },
    'cs9zcyre': {
      'en': '0:25',
      'th': '',
    },
    'wnoi0abl': {
      'en': '0:30',
      'th': '',
    },
    'bv5whw9a': {
      'en': '0:35',
      'th': '',
    },
    '5z7ufov8': {
      'en': '0:40',
      'th': '',
    },
    'dhg24t6h': {
      'en': '0:45',
      'th': '',
    },
    'ahpblc9b': {
      'en': '0:50',
      'th': '',
    },
    'nkv4nzmi': {
      'en': '0:55',
      'th': '',
    },
    '17x0elhu': {
      'en': '1:00',
      'th': '',
    },
    'jhthqy4p': {
      'en': 'Working Time',
      'th': '',
    },
    'mnvztsxt': {
      'en': 'Search for an item...',
      'th': '',
    },
    'kb2s1ruc': {
      'en': 'Resting Interval',
      'th': '',
    },
    '1y90fhqr': {
      'en': '0:10',
      'th': '',
    },
    'yjqd77tp': {
      'en': '0:15',
      'th': '',
    },
    'unrhcqna': {
      'en': '0:20',
      'th': '',
    },
    '0y81k3a1': {
      'en': '0:25',
      'th': '',
    },
    'q3mk9tin': {
      'en': '0:30',
      'th': '',
    },
    'dsh2ob8b': {
      'en': '0:35',
      'th': '',
    },
    'ovlfqsj2': {
      'en': '0:40',
      'th': '',
    },
    'alzu9twu': {
      'en': '0:45',
      'th': '',
    },
    'j5qbzxrm': {
      'en': '0:50',
      'th': '',
    },
    '7w7zkzq4': {
      'en': '0:55',
      'th': '',
    },
    '2p6tsv1j': {
      'en': '1:00',
      'th': '',
    },
    '8ji21fpx': {
      'en': 'Rest Time',
      'th': '',
    },
    'gpeeo66v': {
      'en': 'Search for an item...',
      'th': '',
    },
    'g8h1ojsm': {
      'en': 'Exercise Library',
      'th': '',
    },
    'eo0tbowu': {
      'en': 'Timer',
      'th': '',
    },
    '2gueynm6': {
      'en': 'Timer',
      'th': '',
    },
  },
  // deleteProgramBottomSheet
  {
    'garzgyg4': {
      'en': 'Delete Program',
      'th': '',
    },
    'vz8off1a': {
      'en': 'Cancel',
      'th': '',
    },
  },
  // kgInput
  {
    'nu1pw3mh': {
      'en': 'kg',
      'th': '',
    },
  },
  // workoutSetListItem
  {
    '0ongiyg0': {
      'en': 'reps',
      'th': '',
    },
  },
  // Miscellaneous
  {
    '0akax9ls': {
      'en': '',
      'th': '',
    },
    'xp08t648': {
      'en': '',
      'th': '',
    },
    '8hslyamu': {
      'en': '',
      'th': '',
    },
    'bt24x4k1': {
      'en': '',
      'th': '',
    },
    '1pyj4yge': {
      'en': '',
      'th': '',
    },
    'tfqatzuu': {
      'en': '',
      'th': '',
    },
    'jpndknps': {
      'en': '',
      'th': '',
    },
    's5da7wxn': {
      'en': '',
      'th': '',
    },
    'kjfk6tyq': {
      'en': '',
      'th': '',
    },
    'a868fa10': {
      'en': '',
      'th': '',
    },
    '7qd9g266': {
      'en': '',
      'th': '',
    },
    'rbwskmjr': {
      'en': '',
      'th': '',
    },
    'g98c37ar': {
      'en': '',
      'th': '',
    },
    'oqvlato4': {
      'en': '',
      'th': '',
    },
    'vtyeelcv': {
      'en': '',
      'th': '',
    },
    'vwdqr7b3': {
      'en': '',
      'th': '',
    },
    'g4rcynrj': {
      'en': '',
      'th': '',
    },
    'epm7l173': {
      'en': '',
      'th': '',
    },
    'a40aajlz': {
      'en': '',
      'th': '',
    },
    'lky3kpgs': {
      'en': '',
      'th': '',
    },
    'xc16kaue': {
      'en': '',
      'th': '',
    },
    'a6judhci': {
      'en': '',
      'th': '',
    },
    '2cj63zri': {
      'en': '',
      'th': '',
    },
    'u73ouvz0': {
      'en': '',
      'th': '',
    },
    '1yhusdy9': {
      'en': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));

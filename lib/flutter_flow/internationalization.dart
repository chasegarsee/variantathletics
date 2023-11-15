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
    '7lqtxh5b': {
      'en': 'All Exercises',
      'th': '',
    },
    'lrfgewuu': {
      'en': 'All Exercises',
      'th': 'ทั้งหมด',
    },
    '4ukyq9iy': {
      'en': 'Abs',
      'th': 'หน้าท้อง',
    },
    't2al7jx7': {
      'en': 'Back',
      'th': 'หลัง',
    },
    'iuhonn55': {
      'en': 'Calves',
      'th': 'น่อง',
    },
    '32qi5kdz': {
      'en': 'Chest',
      'th': 'หน้าอก',
    },
    '3vxvvy6i': {
      'en': 'Forearms',
      'th': 'ปลายแขน',
    },
    '4mz6lzbm': {
      'en': 'Glutes',
      'th': 'ก้น',
    },
    'b9r4gz4p': {
      'en': 'Hamstrings',
      'th': 'หลังขา',
    },
    'xo0oy3qa': {
      'en': 'Lower Back',
      'th': 'หลังส่วนล่าง',
    },
    'husp00m8': {
      'en': 'Quads',
      'th': 'หน้าขา',
    },
    'kf3wmhcs': {
      'en': 'Shoulders',
      'th': 'ไหล่',
    },
    'erzvebqr': {
      'en': 'Traps',
      'th': 'ไหล่บน',
    },
    'alwez0i5': {
      'en': 'Triceps',
      'th': 'หลังแขน',
    },
    'le2bq9v5': {
      'en': 'Biceps',
      'th': 'หน้าแขน',
    },
    'r7x3za7i': {
      'en': 'select a muscle group...',
      'th': 'เลือกกลุ่มกล้าม...',
    },
    'cj4l599l': {
      'en': 'Search for target muscle group',
      'th': 'ค้นหากลุ่มกล้าม',
    },
    'rjfasw7r': {
      'en': 'Oops!',
      'th': 'อะโอห์',
    },
    'vf1zei5h': {
      'en':
          'It looks like you dont have access to this page. Click the button below to gain access!',
      'th':
          'ดูเหมือนว่าคุณจะไม่สามารถเข้าถึงหน้านี้ได้ คลิกปุ่มด้านล่างเพื่อเข้าใช้งาน!',
    },
    '90oxmmck': {
      'en': 'Get Access!',
      'th': 'ได้รับการเข้าถึง',
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
    'oqqtirpo': {
      'en': 'Elapsed',
      'th': 'ผ่านไปแล้ว',
    },
    'cwfm3jpz': {
      'en': 'Sets',
      'th': 'เซ็ต',
    },
    'kmnfcmrh': {
      'en': 'Working Interval',
      'th': 'เวลาการออกกำลัง',
    },
    'uhgjokn5': {
      'en': '0:10',
      'th': '0:10',
    },
    'cs9zcyre': {
      'en': '0:15',
      'th': '0:15',
    },
    'wnoi0abl': {
      'en': '0:20',
      'th': '0:20',
    },
    'bv5whw9a': {
      'en': '0:25',
      'th': '0:25',
    },
    '5z7ufov8': {
      'en': '0:30',
      'th': '0:30',
    },
    'dhg24t6h': {
      'en': '0:35',
      'th': '0:35',
    },
    'ahpblc9b': {
      'en': '0:40',
      'th': '0:40',
    },
    'nkv4nzmi': {
      'en': '0:45',
      'th': '0:45',
    },
    '17x0elhu': {
      'en': '0:50',
      'th': '0:50',
    },
    '1hr8d4wn': {
      'en': '0:55',
      'th': '0:55',
    },
    '4omtlso0': {
      'en': '1:00',
      'th': '1:00',
    },
    'jhthqy4p': {
      'en': 'Working Time',
      'th': 'เวลาการออกกำลัง',
    },
    'mnvztsxt': {
      'en': 'Search for an item...',
      'th': '',
    },
    'kb2s1ruc': {
      'en': 'Resting Interval',
      'th': 'ช่วงพัก',
    },
    '1y90fhqr': {
      'en': '0:00',
      'th': '',
    },
    'yjqd77tp': {
      'en': '0:05',
      'th': '0:05',
    },
    'unrhcqna': {
      'en': '0:10',
      'th': '0:10',
    },
    '0y81k3a1': {
      'en': '0:15',
      'th': '0:15',
    },
    'q3mk9tin': {
      'en': '0:20',
      'th': '0:20',
    },
    'dsh2ob8b': {
      'en': '0:25',
      'th': '0:25',
    },
    'ovlfqsj2': {
      'en': '0:30',
      'th': '0:30',
    },
    'alzu9twu': {
      'en': '0:35',
      'th': '0:35',
    },
    'j5qbzxrm': {
      'en': '0:40',
      'th': '0:40',
    },
    '7w7zkzq4': {
      'en': '0:45',
      'th': '0:45',
    },
    '2p6tsv1j': {
      'en': '0:50',
      'th': '0:50',
    },
    'r92yrir2': {
      'en': '0:55',
      'th': '0:55',
    },
    '9zrg43kk': {
      'en': '1:00',
      'th': '1:00',
    },
    '8ji21fpx': {
      'en': 'Rest Time',
      'th': 'ช่วงพัก',
    },
    'gpeeo66v': {
      'en': 'Search for an item...',
      'th': '',
    },
    'd77jisee': {
      'en': '',
      'th': '',
    },
    'g8h1ojsm': {
      'en': 'Exercise Library',
      'th': 'ท่าออกกำลังกาย',
    },
    'pmihhz0h': {
      'en': 'Program',
      'th': 'โปรแกรม',
    },
    'jc36azpj': {
      'en': 'VARIANT',
      'th': '',
    },
    '2gueynm6': {
      'en': 'Timer',
      'th': '',
    },
  },
  // program
  {
    'xj8pase6': {
      'en': 'Sets',
      'th': 'เซ็ต',
    },
    'ed2bmguh': {
      'en': 'Reps',
      'th': 'เร็พ',
    },
    'f99yl0no': {
      'en': 'tempo',
      'th': '',
    },
    'ntm5c1n4': {
      'en': 'Work Time',
      'th': 'เวลาออกแรง',
    },
    '81yyycmt': {
      'en': 'Rest Time',
      'th': 'เวลาพัก',
    },
    'pus4pdls': {
      'en': 'Select Workout To Begin',
      'th': 'เลือกการออกกำลังกายเพื่อเริ่มต้น',
    },
    'di4t2jeu': {
      'en': 'Complete Workout',
      'th': 'เล่นเสร็จแล้ว',
    },
    's2xpl59s': {
      'en': 'Loading...',
      'th': '',
    },
    'vnvch7gg': {
      'en': 'Home',
      'th': '',
    },
  },
  // signin
  {
    '6qbw7glm': {
      'en': 'VARIANT',
      'th': '',
    },
    'hek6bip9': {
      'en': 'Sign In',
      'th': 'เข้าสู่ระบบ',
    },
    'b8906kon': {
      'en': 'Let\'s get started by filling out the form below.',
      'th': 'เริ่มต้นด้วยการกรอกแบบฟอร์มด้านล่าง',
    },
    'u4uq9csb': {
      'en': 'Email',
      'th': 'อีเมล',
    },
    '3b9k8ylr': {
      'en': 'Password',
      'th': 'รหัสผ่าน',
    },
    'lpqe2uhr': {
      'en': 'Sign In',
      'th': 'เข้าสู่ระบบ',
    },
    'fenb4djh': {
      'en': 'Don\'t have an account? ',
      'th': 'ยังไม่มีบัญชี',
    },
    'z15uwdds': {
      'en': ' Sign Up here',
      'th': 'ลงทะเบียนที่นี่',
    },
    '5ovtiq91': {
      'en': 'Home',
      'th': '',
    },
  },
  // signup
  {
    'xdjla4c1': {
      'en': 'VARIANT',
      'th': '',
    },
    'jx46prko': {
      'en': 'Sign Up',
      'th': 'ลงชื่อ',
    },
    '90njkjzq': {
      'en': 'Let\'s get started by filling out the form below.',
      'th': 'เริ่มต้นด้วยการกรอกแบบฟอร์มด้านล่าง',
    },
    '30kf6clo': {
      'en': 'Email',
      'th': 'อีเมล',
    },
    'z36zvri6': {
      'en': 'Password',
      'th': 'รหัสผ่าน',
    },
    'zccbj3xo': {
      'en': 'Confirm Password',
      'th': 'ยืนยันรหัสผ่าน',
    },
    's14s2wyk': {
      'en': 'Let\'s get started',
      'th': 'มาเริ่มกันเลย',
    },
    '6v1li79d': {
      'en': 'Already have an account? ',
      'th': 'มีบัญชีอยู่แล้ว',
    },
    'fxka3kf7': {
      'en': 'Sign In here',
      'th': 'เข้าสู่ระบบที่นี่',
    },
    'cp9imxx4': {
      'en': 'Home',
      'th': '',
    },
  },
  // profile
  {
    '577yksax': {
      'en': 'Switch to Dark Mode',
      'th': 'สลับไปที่โหมดมืด',
    },
    'zbmlau97': {
      'en': 'Switch to Light Mode',
      'th': 'สลับไปที่โหมดแสง',
    },
    'h0v7c7oj': {
      'en': 'Log Out',
      'th': 'ออกจากระบบ',
    },
    '8g0phl9g': {
      'en': '__',
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
  // daysPlaceholder
  {
    '48otjann': {
      'en': 'D-1',
      'th': '',
    },
    'lz75stmz': {
      'en': 'D-2',
      'th': '',
    },
    '0i3waa86': {
      'en': 'D-3',
      'th': '',
    },
    'qspbidd5': {
      'en': 'D-4',
      'th': '',
    },
    'o09oktwo': {
      'en': 'D-5',
      'th': '',
    },
    'oasq6mrb': {
      'en': 'D-6',
      'th': '',
    },
    'vwg66sbq': {
      'en': 'D-7',
      'th': '',
    },
  },
  // Miscellaneous
  {
    '0akax9ls': {
      'en':
          'This app does needs access to your camera, but does not collect video data. This is access is not used within the app, but belongs to a third party API in use',
      'th': '',
    },
    'xp08t648': {
      'en':
          'This app does needs access to your photos, but does not collect image data. This is access is not used within the app, but belongs to a third party API in use',
      'th': '',
    },
    'qlooevri': {
      'en':
          'This app does needs access to your microphone, but does not collect audio data. This is access is not used within the app, but belongs to a third party API in use',
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

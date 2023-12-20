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
    '5ovfnw7u': {
      'en': 'VARIANT',
      'th': 'VARIANT',
    },
    '7lqtxh5b': {
      'en': 'All Exercises',
      'th': 'ทั้งหมด',
    },
    'lrfgewuu': {
      'en': 'All Exercises',
      'th': 'ทั้งหมด',
    },
    '4ukyq9iy': {
      'en': 'Legs',
      'th': 'ขาทั้งหมด',
    },
    't2al7jx7': {
      'en': 'Back',
      'th': 'หลัง',
    },
    'iuhonn55': {
      'en': 'Arms',
      'th': 'แขนทั้งหมด',
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
    'thqv0eis': {
      'en': 'Abs',
      'th': 'หน้าท้อง',
    },
    '4gppe0hd': {
      'en': 'Calves',
      'th': 'น่อง',
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
      'th': '0:00',
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
    'nrgtv1li': {
      'en': 'VARIANT',
      'th': 'VARIANT',
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
      'en': 'Tempo',
      'th': 'จังหวะ',
    },
    'ntm5c1n4': {
      'en': 'Work Time',
      'th': 'เวลาออกแรง',
    },
    '81yyycmt': {
      'en': 'Rest Time',
      'th': 'เวลาพัก',
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
      'th': 'VARIANT',
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
      'th': 'VARIANT',
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
    'mcim9fbw': {
      'en': 'Required',
      'th': 'จำเป็น',
    },
    '3khun89n': {
      'en': '',
      'th': '',
    },
    'zj6raol5': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'ieqemiz5': {
      'en': 'Display Name',
      'th': 'ชื่อเล่น',
    },
    'l4aozokw': {
      'en': 'Required',
      'th': 'จำเป็น',
    },
    'ect2zggz': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
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
    '7hdbt159': {
      'en': 'Switch to English',
      'th': 'เปลี่ยนเป็นภาษาอังกฤษ',
    },
    'wzbbny6i': {
      'en': 'EN',
      'th': 'EN',
    },
    '5kkt05e5': {
      'en': 'Switch to Thai',
      'th': 'เปลี่ยนเป็นภาษาไทย',
    },
    'fn7670tz': {
      'en': 'ไทย',
      'th': 'ไทย',
    },
    '6fjbpfrq': {
      'en': 'Nutrition Hub',
      'th': 'ศูนย์โภชนาการ',
    },
    'o4pthagk': {
      'en': 'Knowlege Hub',
      'th': 'ศูนย์ความรู้',
    },
    'ixqki3gd': {
      'en': 'Message Center',
      'th': 'ศูนย์ข้อความ',
    },
    '80sul3wg': {
      'en': 'Leave comments after completing workouts',
      'th': 'แสดงความคิดเห็นหลังออกกำลังกายเสร็จ',
    },
    'tp6kfy1h': {
      'en': 'Account Status: VARIANT LIFETIME',
      'th': 'สถานะข้อมูล: VARIANT PRO',
    },
    'n4vkcrs2': {
      'en': 'PRO',
      'th': 'PRO',
    },
    'r2etes77': {
      'en': 'Lifetime VARIANT. No Purchase Required',
      'th': 'สมาชิกตลอดชีพ ไม่จำเป็นต้องซื้อต่อ',
    },
    'h0v7c7oj': {
      'en': 'Log Out',
      'th': 'ออกจากระบบ',
    },
    '1hgogtli': {
      'en': 'VARIANT',
      'th': 'VARIANT',
    },
    '8g0phl9g': {
      'en': '__',
      'th': '',
    },
  },
  // nutritionhub
  {
    'z5s1tjv4': {
      'en': 'Your Macronutrients',
      'th': 'สารอาหารของคุณ',
    },
    'ieuldi79': {
      'en': 'Total Calories',
      'th': 'แคลอรี่ทั้งหมด',
    },
    'mps0uype': {
      'en': 'Based on your goal to ',
      'th': 'ขึ้นอยู่กับเป้าหมายของคุณที่จะ ',
    },
    '5yp8oj9v': {
      'en': 'Protein',
      'th': 'โปรตีน',
    },
    'dyyn9jew': {
      'en': 'g',
      'th': 'กรัม',
    },
    '1mcjm01p': {
      'en': 'Carbs',
      'th': 'คาร์บ',
    },
    'bbvvtie3': {
      'en': 'g',
      'th': 'กรัม',
    },
    'qi0gnk6q': {
      'en': 'Fat',
      'th': 'ไขมัน',
    },
    '1zvm7bif': {
      'en': 'g',
      'th': 'กรัม',
    },
    'pezhvg1t': {
      'en': 'Weight History',
      'th': 'ประวัติน้ำหนัก',
    },
    'n05a4z0w': {
      'en': 'weight progress',
      'th': '',
    },
    'ietj7c98': {
      'en': 'Protein',
      'th': 'โปรตีน',
    },
    '4mj2c9es': {
      'en': '/day',
      'th': '/วัน',
    },
    'si8x2l80': {
      'en': '/g~',
      'th': '/กรัม~',
    },
    'jrvbkajw': {
      'en': 'Vegetables',
      'th': 'ผัก',
    },
    'ohumwb7l': {
      'en': '/day',
      'th': '/วัน',
    },
    'dw3pu35j': {
      'en': '/g~',
      'th': '/กรัม~',
    },
    'wwonjlid': {
      'en': 'Carbs',
      'th': 'คาร์บ',
    },
    'orvxjnco': {
      'en': '/day',
      'th': '/วัน',
    },
    'w08t5xmq': {
      'en': '/g~',
      'th': '/กรัม~',
    },
    'krpc2490': {
      'en': 'Fat',
      'th': 'ไขมัน',
    },
    'z9agq4o1': {
      'en': '/day',
      'th': '/วัน',
    },
    '0rk4thvn': {
      'en': '/g~',
      'th': '/กรัม~',
    },
    'vxvik703': {
      'en': 'Nutrition Hub',
      'th': 'ศูนย์โภชนาการ',
    },
    '6oyi1h26': {
      'en': 'Home',
      'th': '',
    },
  },
  // info
  {
    'yy5hm7g3': {
      'en': 'App Version:  ',
      'th': 'แอปเวอร์ชัน: ',
    },
    '99450gjc': {
      'en': 'How to delete your account?',
      'th': 'วิธีการลบข้อมูล',
    },
    'zspi0vg7': {
      'en': 'Have questions about your account or subscription?',
      'th': 'มีคำถามเกี่ยวกับสมาชิกของคุณ?',
    },
    '219d9vcd': {
      'en': 'Change password',
      'th': 'เปลี่ยนรหัสผ่าน',
    },
    'fn2v0o01': {
      'en': 'VARIANT',
      'th': 'VARIANT',
    },
    '87igkgu5': {
      'en': 'Home',
      'th': '',
    },
  },
  // knowledgeHub
  {
    '30d1azpf': {
      'en': 'Knowledge Hub',
      'th': 'ศูนย์ความรู้',
    },
    'aip5pzdg': {
      'en': 'Home',
      'th': '',
    },
  },
  // pdfPage
  {
    '1tniq6qs': {
      'en': 'Home',
      'th': '',
    },
  },
  // favorites
  {
    'q12egrw8': {
      'en': 'Favorites',
      'th': 'รายการโปรด',
    },
    'jhvitjp9': {
      'en': 'Home',
      'th': '',
    },
  },
  // MessageCenter
  {
    '8oeyy7ai': {
      'en': ' ',
      'th': '',
    },
    '8t2tjpm4': {
      'en': 'Message Center',
      'th': 'ศูนย์ข้อความ',
    },
    'm2djtz22': {
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
  // sizeDemographicsBottomSheet
  {
    'cr5tocc5': {
      'en': 'Choose the options that best describe you',
      'th': 'เลือกตัวเลือกที่ตรงกับตัวคุณมากที่สุด',
    },
    'ndtk6lna': {
      'en': 'Height (cm)',
      'th': 'ความสูง (ซ.ม.)',
    },
    'yq3kiaxw': {
      'en': 'Required',
      'th': '',
    },
    'ium1rkcz': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    'mhiv0rrt': {
      'en': 'Gender',
      'th': 'เพศ',
    },
    'fcyscj1x': {
      'en': 'Female',
      'th': 'หญิง',
    },
    'c7puzize': {
      'en': 'Male',
      'th': 'ชาย',
    },
    'gdkeyh7b': {
      'en': 'Choose gender',
      'th': 'เลือกเพศ',
    },
    'y2riutc3': {
      'en': 'Search for an item...',
      'th': '',
    },
    'ndsqz5nj': {
      'en': 'Age',
      'th': 'อายุ',
    },
    'eu6qqvsa': {
      'en': 'Required',
      'th': '',
    },
    'vgqjexjr': {
      'en': 'minimum 10 y/o required',
      'th': 'ขั้นต่ำ 10 ปี',
    },
    'r8ioqpwt': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '1ns8nopu': {
      'en': 'Weekly activity level ',
      'th': 'ระดับออกกำลังกาย/สัปดาห์',
    },
    'iht6od1b': {
      'en': 'Sedentary (0 days/week)',
      'th': 'ไม่มีการออกกำลังกาย',
    },
    'gqn1deyg': {
      'en': 'Lightly active (1-2 days/week)',
      'th': 'ออกกำลังกายเล็กน้อย',
    },
    '608ws76y': {
      'en': 'Moderately active (3-5 days/week)',
      'th': 'ออกกำลังกาย 3-5x/สัปดาห์',
    },
    'upx9kkkj': {
      'en': 'Very active (6-7 days/week)',
      'th': 'ออกกำลังกาย 6-7x/สัปดาห์',
    },
    '4a81b3y1': {
      'en': 'Athlete (2x day)',
      'th': 'ออกกำลังกาย 2x/วัน',
    },
    'rex7pwr2': {
      'en': 'Choose level',
      'th': 'เลือกระดับของคุณ',
    },
    '6dkx0l42': {
      'en': 'Search for an item...',
      'th': '',
    },
    'q49qpty2': {
      'en': 'Weight (kg)',
      'th': 'น้ำหนัก (ค.ก.)',
    },
    '2tzzxxzw': {
      'en': 'Rrequired',
      'th': '',
    },
    '0tc39lg7': {
      'en': 'Minimun 10 KG required',
      'th': 'ขั้นต่ำ 10kg',
    },
    '4wufkurc': {
      'en': 'Please choose an option from the dropdown',
      'th': '',
    },
    '0mu1uerp': {
      'en': 'Goal',
      'th': 'เป้าหมาย',
    },
    'm37bilqf': {
      'en': 'Cut',
      'th': 'ลดไขมัน',
    },
    '2jfdjs0m': {
      'en': 'Maintenance',
      'th': 'บำรุงรักษา',
    },
    'nei0l69l': {
      'en': 'Bulk',
      'th': 'เพิ่มกล้ามเนื้อ',
    },
    'kq8l92x0': {
      'en': 'Choose goal',
      'th': 'เลือกเป้าหมาย',
    },
    'qksju9ly': {
      'en': 'Search for an item...',
      'th': '',
    },
    '36r5kcg7': {
      'en': 'Confirm',
      'th': 'ยืนยัน',
    },
  },
  // deleteAccount
  {
    'h0y751d1': {
      'en': 'Delete Account',
      'th': 'ลบข้อมูล',
    },
    'os6fur3p': {
      'en': 'Warning!',
      'th': 'คำเตือน',
    },
    'lcg19z7f': {
      'en': 'Deleting the account will lead to total loss of:',
      'th': 'การลบข้อมูลจะนำไปสู่การสูญเสียทั้งหมด',
    },
    'hcbnhr3l': {
      'en': 'workout history',
      'th': 'ประวัติการออกกำลังกาย',
    },
    'lpy69hyo': {
      'en': 'custom macros',
      'th': 'สารอาหารหลักของคุณ',
    },
    'lyn02s9d': {
      'en': 'personal data',
      'th': 'ข้อมูลส่วนตัว',
    },
    'mi0f1d0f': {
      'en':
          'It will not be possible to recover the data after the account has been deleted!',
      'th': 'จะไม่สามารถกู้คืนข้อมูลได้หลังจากที่ข้อมูลถูกลบไปแล้ว',
    },
    'fcmnki9c': {
      'en': 'Delete',
      'th': 'ลบ',
    },
    'z0fuwcrq': {
      'en': 'Cancel',
      'th': 'ยกเลิก',
    },
  },
  // notSubbed
  {
    '20brzamz': {
      'en': 'Oops!',
      'th': 'อะโอห์',
    },
    'chswaljy': {
      'en':
          'It looks like you dont have access to this page. Click the button below to gain access, or click cancel to return',
      'th':
          'ดูเหมือนว่าคุณจะไม่สามารถเข้าถึงหน้านี้ได้ คลิกปุ่มด้านล่างเพื่อเข้าใช้งาน หรือคลิกยกเลิกเพื่อกลับ',
    },
    'rm193j6w': {
      'en': 'Get Access!',
      'th': 'ได้รับการเข้าถึง',
    },
  },
  // workoutComments
  {
    '0oifm2tf': {
      'en': ' ago',
      'th': 'ที่แล้ว',
    },
  },
  // leaveWorkoutComment
  {
    'rrn99ycn': {
      'en': 'Tell me how it went!',
      'th': 'บอกเชษฐ์ว่ามันเป็นยังไง',
    },
    'arzps6b4': {
      'en': 'Leave a comment',
      'th': 'เขียนคอมเม้นท์',
    },
    'h1ll29mw': {
      'en': 'Start typing...',
      'th': 'เริ่มพิมพ์',
    },
  },
  // noCommentsToDisplay
  {
    '6qrsj6aw': {
      'en': 'No comments to display',
      'th': 'ไม่มีคอมเม้นท์ที่จะแสดง',
    },
  },
  // revCatPaywall
  {
    's79a6uqz': {
      'en': 'FREE 7 Day Trial to VARIANT PRO',
      'th': 'ทดลองใช้ VARIANT PRO ฟรี 7 วัน',
    },
    '1i1a8uv0': {
      'en': 'Unlimited access to app functionality',
      'th': 'เข้าถึงฟังก์ชันการทำงานของแอปได้ไม่จำกัด',
    },
    'bz5sfcu5': {
      'en': 'Unlimited access to VARIANT programs',
      'th': 'เข้าถึงโปรแกรม VARIANT ได้ไม่จำกัด',
    },
    'w6r79tif': {
      'en': 'Custom Macro Calculator',
      'th': 'เครื่องคิดเลขธาตุอาหารหลักส่วนตัว',
    },
    'v040zuat': {
      'en': 'Lifetime access to exercise library',
      'th': 'สิทธิ์เข้าใช้ห้องสมุดออกกำลังกายได้ตลอดชีวิต',
    },
    'q7f9i6mw': {
      'en': '6+ Knowledge Building PDFs (new added monthly)',
      'th': 'E-Book การสร้างความรู้ 6+ รายการ (เพิ่มใหม่ทุกเดือน)',
    },
    'cxc6mdxu': {
      'en': '4+ Programs tailored to your needs!  (new added monthly)',
      'th': '4+ โปรแกรมที่เหมาะกับความต้องการ  (เพิ่มใหม่ทุกเดือน)',
    },
    '7mup3duq': {
      'en': 'No Equiptment Body Weight Program Included',
      'th': 'โปรแกรมออกกำลังกายจากที่บ้าน',
    },
    '4a5xgdoq': {
      'en': 'Full access for just ',
      'th': 'ทุกคุณสมบัติในราคาเพียง',
    },
    'qscd8ud1': {
      'en': 'Become a VARIANT',
      'th': 'เข้าสู่ชุมชน VARIANT',
    },
    'b8h0n0y4': {
      'en': 'Restore',
      'th': 'คืนค่า',
    },
  },
  // emptyFavorites
  {
    't8fkforg': {
      'en': 'Add ',
      'th': 'เพิ่ม',
    },
    '6r2zmrik': {
      'en': 'exercises ',
      'th': 'แบบฝึกหัด',
    },
    'bw1x04z5': {
      'en': 'as favorites to populate list',
      'th': 'เป็นรายการโปรดเพื่อเติมรายการ',
    },
  },
  // selectProgram
  {
    'xyz0e2ce': {
      'en': 'COMING SOON',
      'th': 'เร็วๆ นี้',
    },
    'eod9rf46': {
      'en':
          'Selecting a new program will result in all progress on your current program being lost. ',
      'th':
          'การเลือกโปรแกรมใหม่จะส่งผลให้ความคืบหน้าทั้งหมดของโปรแกรมปัจจุบันของคุณหายไป ',
    },
    'ej86wcg2': {
      'en': 'This cannot be undone',
      'th': 'สิ่งนี้ไม่สามารถยกเลิกได้',
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
    'a6jstwic': {
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ar', 'en'];

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
    String? arText = '',
    String? enText = '',
  }) =>
      [arText, enText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    'xzo8gbcg': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // listView
  {
    'g2j861fu': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    'vfxshvgh': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    'tbxlpsbl': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    'y08nraym': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    '5hdkzvad': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    '3ygqlc89': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    'gp4o9mrx': {
      'ar': 'نەخشە',
      'en': 'Nakhsha',
    },
    'qhuihy6x': {
      'ar': 'لیست',
      'en': 'Not',
    },
    'e4xmhbbr': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // itemView
  {
    'yc5amqw0': {
      'ar': 'سکاڵا Report',
      'en': 'Scala Report',
    },
    'ye716cwp': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // drawer2-4-5
  {
    'lfs3z48h': {
      'ar': 'ڕێنماییەکان',
      'en': 'Numbers',
    },
    'o351oj45': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // drawer6
  {
    '94phvfhx': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // drawer3
  {
    'j9dwbl8h': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // login
  {
    '99ob9083': {
      'ar': 'گەڕانەوە',
      'en': 'گەڕانەوە',
    },
    'dhumhxxx': {
      'ar': 'بەخێربێی',
      'en': '',
    },
    'ssxwz2ge': {
      'ar': 'تکایە ژمارەی مۆبایلت بنووسە',
      'en': 'تکایە ژمارەی مۆبایلت بنووسە',
    },
    'dvcvf4x2': {
      'ar': 'ژمارەی مۆبایل',
      'en': 'ژمارەی مۆبایل',
    },
    '014vuokm': {
      'ar': '+964',
      'en': '964+',
    },
    '1ehgm07z': {
      'ar': ' XXX XXXXX',
      'en': 'XXX XXXXX',
    },
    '1ynx9xw0': {
      'ar': '',
      'en': '',
    },
    'u0abdptb': {
      'ar': 'ناردنی کۆدa',
      'en': 'ناردنی کۆدa',
    },
    'kr8ti9po': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // pinCode
  {
    'eqqllzqj': {
      'ar': 'پشتڕاستکردنەوە',
      'en': 'پشتڕاستکردنەوە',
    },
    'sshw4n8p': {
      'ar': 'تکایە کۆدی هاتوو بە نامە لێرە بنووسە',
      'en': 'تکایە کۆدی هاتوو بە نامە لێرە بنووسە',
    },
    '8lga4e4k': {
      'ar': 'دووبارە ناردنەوەی کۆد',
      'en': 'دووبارە ناردنەوەی کۆد',
    },
    'xfn2np3m': {
      'ar': 'پشتڕاستکردنەوە',
      'en': 'پشتڕاستکردنەوە',
    },
    'ecst33sx': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // welcomePage
  {
    '9t0zlt4n': {
      'ar': 'بەخێربێی\nبۆ ڕێبەری',
      'en': 'بەخێربێی\nبۆ ڕێبەری',
    },
    '28x0ezz5': {
      'ar':
          'تکایە گەر زمانی کوردی دەزانی زمانی کوردی هەڵبژێرە زمانەکانی تر وەکو ڕێبەری گەشتیاری کاردەکات و گشت بەشەکانی تێدا نیە ',
      'en':
          'تکایە گەر زمانی کوردی دەزانی زمانی کوردی هەڵبژێرە زمانەکانی تر وەکو ڕێبەری گەشتیاری کاردەکات و گشت بەشەکانی تێدا نیە ',
    },
    'eu5jj0ia': {
      'ar': 'Select language',
      'en': 'Select language',
    },
    'tuobjhyt': {
      'ar': 'KU',
      'en': 'KU',
    },
    'k7lcanvl': {
      'ar': 'کوردی',
      'en': 'کوردی',
    },
    'opdbth6y': {
      'ar': 'AR',
      'en': 'AR',
    },
    '8cnvyrmf': {
      'ar': 'عربی',
      'en': 'عربی',
    },
    'xggyv2qc': {
      'ar': 'EN',
      'en': 'EN',
    },
    '8ah8v3n0': {
      'ar': 'English',
      'en': 'English',
    },
    'ttjg4dni': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // OTPverified
  {
    'byjjd6xs': {
      'ar': 'ژمارەکەت پشتڕاستکراوە',
      'en': 'ژمارەکەت پشتڕاستکراوە',
    },
    '9nb1l121': {
      'ar': 'تکایە چاوەڕوانبە تا دەچیتە ناو ڕێبەری',
      'en': 'تکایە چاوەڕوانبە تا دەچیتە ناو ڕێبەری',
    },
    '39nkp9s2': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // donations
  {
    'ajjua1xn': {
      'ar': 'پاڵپشتی کردنت بەرنامەکە بەرەوپێش دەبات',
      'en': 'What is your financial record?',
    },
    'psyhp3sy': {
      'ar': '',
      'en': '',
    },
    'q5jrz94o': {
      'ar': 'ڕێگای ناردن',
      'en': 'Nardin\'s path',
    },
    'urdqr95d': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    'fequ1tun': {
      'ar': 'بەخشینەکان',
      'en': 'Bakhshinkan',
    },
    'hfsdl0gs': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // support
  {
    'zp6p8cmu': {
      'ar': 'هاوکاری',
      'en': 'Get support',
    },
    'izn7emhy': {
      'ar': 'بەخێربێی بۆ بەشی هاوکاری',
      'en': 'Welcome to support',
    },
    '0oulky6b': {
      'ar': 'چۆن دەتوانم یارمەتیت بدەم؟',
      'en': 'How can we help you?',
    },
    'k9u4ikbi': {
      'ar': 'WhatsApp',
      'en': 'WhatsApp',
    },
    'og1vwq1q': {
      'ar': 'پرسیارە باوەکان',
      'en': 'Review FAQ\'s below',
    },
    'c3a85vqr': {
      'ar': 'چۆن ئەکاونت بکەمەوە ؟',
      'en': 'How do I download Code?',
    },
    'q8rjh7lc': {
      'ar':
          'بۆ کردنەوەی ئەکاونتێک تەنها پێویستیت بە ژمارە مۆبەیلێکە کە لەڕیگەی کۆدێک بە نامە بۆت دێتەوە ئەکاونتەکە چاڵاک دەبێ',
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
    },
    'r7tyzul4': {
      'ar': 'بۆ ئەکاونتەکەم بلۆک کراوە لە ڕێبەری ؟',
      'en': 'How do I download Code?',
    },
    'asf9orcx': {
      'ar':
          'بەهۆی بەکارهێنانی نەشیاو یان سکاڵای بێ هۆکار بۆ چەند جارێک و پێدانی سکاڵای ناڕاست ئەکاونتەکەت بلۆک دەکرێ\nبۆ لادانی بلۆکەکە تکایە واتساپی سەرەوە بەکاربێنە بۆ قسەکردن لەگەڵ تیمەکانی بەرنامەی ڕێبەری',
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
    },
    'x43updmt': {
      'ar':
          'چ جۆرە ڕێگەپێدانکم پێویستە لە مۆبایلەکەم تا ڕێبەری بەتەواوی کار بکات ؟',
      'en': 'How do I download Code?',
    },
    'cwym7bue': {
      'ar':
          'پێویستیت بە ڕێگەپێدانی جی پی ئێس و نۆتیفیکەیشن و ئەتەرنێت دەبێ بۆ تەواو کارکردنی بەرنامەی ڕێبەری',
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
    },
    'oa7mdy3v': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // userBlock
  {
    '2dca7ly2': {
      'ar': 'هەژمارەکەت ڕاگیراوە بەهۆی بەکارهێنانی نەشیاو لە بەرنامەکەa',
      'en': 'تکایە ژمارەی مۆبایلت بنووسە',
    },
    'fwmn4lc1': {
      'ar': 'بۆ چاڵاککردنەوەی هەژمارەکەت تکایە پەیوەندی بکە',
      'en': 'بۆ چاڵاککردنەوەی هەژمارەکەت تکایە پەیوەندی بکە',
    },
    'sijpcwmi': {
      'ar':
          'We have detected some suspicious activity from your side, which is why your account has been blocked. To unblock your account, kindly contact our support team',
      'en': '',
    },
    'dasmpncb': {
      'ar': 'Contact Support',
      'en': 'Contact Support',
    },
    '3e2fsvld': {
      'ar': 'Home',
      'en': 'Home',
    },
  },
  // itemViewreport
  {
    'nupap849': {
      'ar': 'جۆری سکاڵا Report',
      'en': 'Jory Scala Report',
    },
    '0rcv7kix': {
      'ar': 'Search...',
      'en': 'Search...',
    },
    'x6rhsebx': {
      'ar': 'ناردنی سکاڵا Report',
      'en': 'Nardinskaya Report',
    },
  },
  // Miscellaneous
  {
    'agtey2kx': {
      'ar': '',
      'en': '',
    },
    'zz3eqsba': {
      'ar': 'Need to send alerts.',
      'en': '',
    },
    'w9hc65qu': {
      'ar': '',
      'en': '',
    },
    '44in3xza': {
      'ar': '',
      'en': '',
    },
    'iizricry': {
      'ar': '',
      'en': '',
    },
    '0ymem46v': {
      'ar': '',
      'en': '',
    },
    'datapqxc': {
      'ar': '',
      'en': '',
    },
    '8tfz9eys': {
      'ar': '',
      'en': '',
    },
    '8cd1bwvu': {
      'ar': '',
      'en': '',
    },
    '05hj8srn': {
      'ar': '',
      'en': '',
    },
    'n804nmdb': {
      'ar': '',
      'en': '',
    },
    'dfpn4cq3': {
      'ar': '',
      'en': '',
    },
    'wty8gvun': {
      'ar': '',
      'en': '',
    },
    'cfl44lbr': {
      'ar': '',
      'en': '',
    },
    'rggvy6dp': {
      'ar': '',
      'en': '',
    },
    'iko018bm': {
      'ar': '',
      'en': '',
    },
    'q46bxyen': {
      'ar': '',
      'en': '',
    },
    '4qn31ekv': {
      'ar': '',
      'en': '',
    },
    'tb3lbo80': {
      'ar': '',
      'en': '',
    },
    'b85o06tw': {
      'ar': '',
      'en': '',
    },
    'p7f05sqd': {
      'ar': '',
      'en': '',
    },
    'teygh9o2': {
      'ar': '',
      'en': '',
    },
    '1br4qdjx': {
      'ar': '',
      'en': '',
    },
    'doebnfd7': {
      'ar': '',
      'en': '',
    },
    '6vkr6wet': {
      'ar': '',
      'en': '',
    },
    'gs537445': {
      'ar': '',
      'en': '',
    },
    '7pbklr57': {
      'ar': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));

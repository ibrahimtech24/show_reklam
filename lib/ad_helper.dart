import 'dart:io';

/// کلاسی یارمەتیدەر بۆ بەڕێوەبردنی ئایدی ریکلامەکان
class AdHelper {
  // ئایدیی بانەر ئاد
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // بۆ تاقیکردنەوە - ئایدیی گووگڵ بەکاربهێنە
      return 'ca-app-pub-3940256099942544/6300978111'; // تاقیکردنەوە
      // بۆ بڵاوکردنەوە ئەمە بەکاربهێنە:
      // return 'ca-app-pub-2133874152151468/7892900090';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716'; // تاقیکردنەوە
    }
    throw UnsupportedError('پلاتفۆرمی پشتگیری نەکراو');
  }

  // ئایدیی ئینتەرستیشڵ ئاد
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // بۆ تاقیکردنەوە - ئایدیی گووگڵ بەکاربهێنە
      return 'ca-app-pub-3940256099942544/1033173712'; // تاقیکردنەوە
      // بۆ بڵاوکردنەوە ئەمە بەکاربهێنە:
      // return 'ca-app-pub-2133874152151468/4875854820';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910'; // تاقیکردنەوە
    }
    throw UnsupportedError('پلاتفۆرمی پشتگیری نەکراو');
  }

  // ئایدیی تاقیکردنەوە بۆ ریواردید ئاد
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917'; // تاقیکردنەوە
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313'; // تاقیکردنەوە
    }
    throw UnsupportedError('پلاتفۆرمی پشتگیری نەکراو');
  }
}

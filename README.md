# 📱 ریکلامەکانی گۆگڵ (Google AdMob)

پڕۆژەیەکی فلاتەرە بۆ نیشاندانی ریکلامەکانی Google AdMob

## ✨ تایبەتمەندییەکان

- 🎯 **Banner Ad** - ریکلامی بچووک لە خوارەوەی ئەپ
- 📺 **Interstitial Ad** - ریکلامی تەواوی شاشە
- 🎁 **Rewarded Ad** - ریکلام بۆ وەرگرتنی خاڵ

## 📂 پێکهاتەی فایلەکان

```
lib/
├── main.dart           # فایلی سەرەکی
├── ad_manager.dart     # بەڕێوەبردنی ریکلامەکان
└── ad_helper.dart      # ئایدییەکانی ریکلام
```

## 🚀 دامەزراندن

### 1. پێداویستییەکان

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_mobile_ads: ^7.0.0
```

```bash
flutter pub get
```

### 2. رێکخستنی Android

لە `android/app/src/main/AndroidManifest.xml` ئەمە زیاد بکە:

```xml
<application>
    <!-- ئایدیی ئەپی گۆگڵ ئادمۆب -->
    <meta-data
        android:name="com.google.android.gms.ads.APPLICATION_ID"
        android:value="ca-app-pub-2133874152151468~8789380495"/>
</application>
```

### 3. رێکخستنی iOS

لە `ios/Runner/Info.plist` ئەمە زیاد بکە:

```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-2133874152151468~8789380495</string>
```

## 💡 چۆنیەتی بەکارهێنان

### 1. دروستکردنی Ad Manager

```dart
final adManager = AdManager();
```

### 2. بارکردنی ریکلامەکان

```dart
@override
void initState() {
  super.initState();
  adManager.loadBannerAd();        // بانەر
  adManager.loadInterstitialAd();  // ئینتەرستیشڵ
  adManager.loadRewardedAd();      // ریواردید
}
```

### 3. نیشاندانی بانەر

```dart
if (adManager.isBannerAdLoaded && adManager.bannerAd != null)
  SizedBox(
    width: adManager.bannerAd!.size.width.toDouble(),
    height: adManager.bannerAd!.size.height.toDouble(),
    child: AdWidget(ad: adManager.bannerAd!),
  )
```

### 4. نیشاندانی Interstitial Ad

```dart
ElevatedButton(
  onPressed: adManager.isInterstitialAdLoaded 
    ? adManager.showInterstitialAd 
    : null,
  child: Text('نیشاندانی ریکلام'),
)
```

### 5. نیشاندانی Rewarded Ad

```dart
adManager.showRewardedAd(
  onReward: (amount, type) {
    print('خاڵ وەرگیرا: $amount');
  },
);
```

### 6. پاککردنەوە

```dart
@override
void dispose() {
  adManager.dispose();
  super.dispose();
}
```

## 🔧 رێکخستنی ئایدییەکان

لە فایلی `lib/ad_helper.dart` ئایدییەکانت دابنێ:

```dart
static String get bannerAdUnitId {
  if (Platform.isAndroid) {
    return 'ca-app-pub-XXXXXX/YYYYYYY'; // ئایدیی خۆت
  }
  // ...
}
```

### جۆرەکانی ئایدی:

- **App ID**: `ca-app-pub-XXXXX~YYYYY` (لە AndroidManifest)
- **Ad Unit ID**: `ca-app-pub-XXXXX/YYYYY` (لە کۆد)

## 📊 جۆرەکانی ریکلام

### 1️⃣ Banner Ad
- لە خوارەوەی ئەپ نیشان دەدرێت
- هەمیشە بەدی دەکرێت
- قەبارەی بچووک

### 2️⃣ Interstitial Ad
- تەواوی شاشە دادەپۆشێت
- لە نێوان ئەکتیڤیتیەکان نیشان دەدرێت
- پارەی زیاتر

### 3️⃣ Rewarded Ad
- بەکارهێنەر خاڵ یان خەڵات وەردەگرێت
- پێویستە تەواوی بینرێت
- باشترینە بۆ یاریەکان

## ⚠️ تێبینیەکانی گرنگ

1. **ئایدییەکانی تاقیکردنەوە**
   - لە کاتی گەشەپێدان ئایدیی تاقیکردنەوە بەکاربهێنە
   - ئایدیی ڕاستەقینە تەنها بۆ بڵاوکردنەوە

2. **کاتی بارکردن**
   - Ad Unit ـی نوێ 1-24 کاتژمێر دەخایەنێت
   - ئینتەرنێت پێویستە

3. **پارە سازی**
   - تەنها لە ئەپی بڵاوکراوە
   - خۆت کلیک مەکە!
   - کەمتر $100 پارە نادرێت

4. **سیاسەتەکانی گۆگڵ**
   - ناوەڕۆکی گونجاو
   - کلیکی خۆڕایی مەکە
   - شوێنی گونجاو بۆ ریکلام

## 🛠️ چارەسەری کێشەکان

### ریکلام نیشان نادات؟

✅ پشکنینی ئینتەرنێت
✅ دڵنیابوون لە ئایدییەکان
✅ چاوەڕێی 1-24 کاتژمێر بۆ Ad Unit ـی نوێ
✅ بەکارهێنانی ئایدیی تاقیکردنەوە

### هەڵەی کۆمپایل؟

```bash
flutter clean
flutter pub get
flutter run
```

## 📱 ڕەن کردن

```bash
# گەشەپێدان
flutter run

# بیلد کردن
flutter build apk --release
flutter build appbundle --release
```

## 📝 تەواوی کۆدەکان

### 1️⃣ lib/ad_helper.dart

```dart
import 'dart:io';

/// کلاسی یارمەتیدەر بۆ بەڕێوەبردنی ئایدی ریکلامەکان
class AdHelper {
  // ئایدیی بانەر ئاد
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      // ئایدیی تاقیکردنەوەی گووگڵ - یەکسەر کاردەکات
      return 'ca-app-pub-3940256099942544/6300978111';

      // بۆ بڵاوکردنەوە ئەمە بەکاربهێنە:
      // return 'ca-app-pub-2133874152151468/7892900090';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    throw UnsupportedError('پلاتفۆرمی پشتگیری نەکراو');
  }

  // ئایدیی ئینتەرستیشڵ ئاد
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      // ئایدیی تاقیکردنەوەی گووگڵ - یەکسەر کاردەکات
      return 'ca-app-pub-3940256099942544/1033173712';

      // بۆ بڵاوکردنەوە ئەمە بەکاربهێنە:
      // return 'ca-app-pub-2133874152151468/4875854820';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    }
    throw UnsupportedError('پلاتفۆرمی پشتگیری نەکراو');
  }

  // ئایدیی ریواردید ئاد
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    }
    throw UnsupportedError('پلاتفۆرمی پشتگیری نەکراو');
  }
}
```

### 2️⃣ lib/ad_manager.dart

```dart
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

/// کلاسی بەڕێوەبەری ریکلامەکان
class AdManager {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  bool _isBannerAdLoaded = false;
  bool _isInterstitialAdLoaded = false;
  bool _isRewardedAdLoaded = false;

  BannerAd? get bannerAd => _bannerAd;
  bool get isBannerAdLoaded => _isBannerAdLoaded;
  bool get isInterstitialAdLoaded => _isInterstitialAdLoaded;
  bool get isRewardedAdLoaded => _isRewardedAdLoaded;

  /// بارکردنی بانەر ئاد
  void loadBannerAd() {
    print('🔄 دەست بە بارکردنی بانەر...');
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _isBannerAdLoaded = true;
          print('✅ بانەر بارکرا!');
        },
        onAdFailedToLoad: (ad, error) {
          _isBannerAdLoaded = false;
          ad.dispose();
          print('❌ بانەر بارنەبوو: $error');
        },
      ),
    )..load();
  }

  /// بارکردنی ئینتەرستیشڵ ئاد
  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoaded = true;

          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _isInterstitialAdLoaded = false;
              loadInterstitialAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _isInterstitialAdLoaded = false;
              print('❌ شکست: $error');
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isInterstitialAdLoaded = false;
          print('❌ ئینتەرستیشڵ بارنەبوو: $error');
        },
      ),
    );
  }

  /// نیشاندانی ئینتەرستیشڵ ئاد
  void showInterstitialAd() {
    if (_isInterstitialAdLoaded && _interstitialAd != null) {
      _interstitialAd!.show();
    } else {
      loadInterstitialAd();
    }
  }

  /// بارکردنی ریواردید ئاد
  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedAdLoaded = true;

          _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _isRewardedAdLoaded = false;
              loadRewardedAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _isRewardedAdLoaded = false;
              print('❌ شکست: $error');
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isRewardedAdLoaded = false;
          print('❌ ریواردید بارنەبوو: $error');
        },
      ),
    );
  }

  /// نیشاندانی ریواردید ئاد
  void showRewardedAd({required Function(int amount, String type) onReward}) {
    if (_isRewardedAdLoaded && _rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          onReward(reward.amount.toInt(), reward.type);
        },
      );
    } else {
      loadRewardedAd();
    }
  }

  /// پاککردنەوەی ریکلامەکان
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }
}
```

### 3️⃣ lib/main.dart

```dart
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ریکلامەکانی گۆگڵ',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _adManager = AdManager();
  int _points = 0;

  @override
  void initState() {
    super.initState();
    print('📱 دەستپێکردنی ئەپ...');
    _adManager.loadBannerAd();
    _adManager.loadInterstitialAd();
    _adManager.loadRewardedAd();
  }

  @override
  void dispose() {
    _adManager.dispose();
    super.dispose();
  }

  void _showRewardAd() {
    _adManager.showRewardedAd(
      onReward: (amount, type) {
        setState(() => _points += amount);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('🎉 $amount خاڵت وەرگرت!'),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ریکلامەکانی گۆگڵ'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.monetization_on,
                    size: 80,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'خاڵەکانت: $_points 🎁',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),

                  ElevatedButton.icon(
                    onPressed: _adManager.isInterstitialAdLoaded
                        ? _adManager.showInterstitialAd
                        : null,
                    icon: const Icon(Icons.fullscreen),
                    label: const Text('ریکلامی تەواو'),
                  ),

                  const SizedBox(height: 16),

                  ElevatedButton.icon(
                    onPressed:
                        _adManager.isRewardedAdLoaded ? _showRewardAd : null,
                    icon: const Icon(Icons.card_giftcard),
                    label: const Text('ریکلام بۆ خاڵ'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // بانەر لە خوارەوە
          if (_adManager.isBannerAdLoaded && _adManager.bannerAd != null)
            SizedBox(
              width: _adManager.bannerAd!.size.width.toDouble(),
              height: _adManager.bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _adManager.bannerAd!),
            ),
        ],
      ),
    );
  }
}
```

## 🌐 سەرچاوەکان

- [Google AdMob](https://admob.google.com)
- [Flutter Google Mobile Ads](https://pub.dev/packages/google_mobile_ads)
- [AdMob Policies](https://support.google.com/admob/answer/6128543)

## 📄 مۆڵەتنامە

MIT License

---

**درووستکراوە بە ❤️ بە Flutter**

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

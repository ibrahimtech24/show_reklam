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

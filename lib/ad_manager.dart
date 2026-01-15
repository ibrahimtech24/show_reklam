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

  // گەتەرەکان
  BannerAd? get bannerAd => _bannerAd;
  bool get isBannerAdLoaded => _isBannerAdLoaded;
  bool get isInterstitialAdLoaded => _isInterstitialAdLoaded;
  bool get isRewardedAdLoaded => _isRewardedAdLoaded;

  /// بارکردنی بانەر ئاد
  Future<void> loadBannerAd() async {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _isBannerAdLoaded = true;
          print('✅ بانەر ئاد بارکرا');
        },
        onAdFailedToLoad: (ad, error) {
          _isBannerAdLoaded = false;
          ad.dispose();
          print('❌ بانەر ئاد بارنەبوو: $error');
        },
      ),
    );

    await _bannerAd!.load();
  }

  /// بارکردنی ئینتەرستیشڵ ئاد
  Future<void> loadInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isInterstitialAdLoaded = true;
          print('✅ ئینتەرستیشڵ ئاد بارکرا');

          // دانانی فول سکرین کۆنتێنت کۆڵبەک
          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  _isInterstitialAdLoaded = false;
                  loadInterstitialAd(); // بارکردنەوەی ریکلامێکی نوێ
                },
                onAdFailedToShowFullScreenContent: (ad, error) {
                  ad.dispose();
                  _isInterstitialAdLoaded = false;
                  print('❌ شکستی نیشاندانی ئینتەرستیشڵ: $error');
                },
              );
        },
        onAdFailedToLoad: (error) {
          _isInterstitialAdLoaded = false;
          print('❌ ئینتەرستیشڵ ئاد بارنەبوو: $error');
        },
      ),
    );
  }

  /// نیشاندانی ئینتەرستیشڵ ئاد
  void showInterstitialAd() {
    if (_isInterstitialAdLoaded && _interstitialAd != null) {
      _interstitialAd!.show();
    } else {
      print('⚠️ ئینتەرستیشڵ ئاد ئامادە نییە');
      loadInterstitialAd();
    }
  }

  /// بارکردنی ریواردید ئاد
  Future<void> loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isRewardedAdLoaded = true;
          print('✅ ریواردید ئاد بارکرا');

          // دانانی فول سکرین کۆنتێنت کۆڵبەک
          _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _isRewardedAdLoaded = false;
              loadRewardedAd(); // بارکردنەوەی ریکلامێکی نوێ
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _isRewardedAdLoaded = false;
              print('❌ شکستی نیشاندانی ریواردید: $error');
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isRewardedAdLoaded = false;
          print('❌ ریواردید ئاد بارنەبوو: $error');
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
          print('🎁 خەڵات وەرگیرا: ${reward.amount} ${reward.type}');
        },
      );
    } else {
      print('⚠️ ریواردید ئاد ئامادە نییە');
      loadRewardedAd();
    }
  }

  /// پاککردنەوەی هەموو ریکلامەکان
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }
}

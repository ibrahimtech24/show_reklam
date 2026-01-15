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
      home: const AdDemoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AdDemoScreen extends StatefulWidget {
  const AdDemoScreen({super.key});

  @override
  State<AdDemoScreen> createState() => _AdDemoScreenState();
}

class _AdDemoScreenState extends State<AdDemoScreen> {
  final AdManager _adManager = AdManager();
  int _rewardPoints = 0;

  @override
  void initState() {
    super.initState();
    _loadAds();
  }

  // بارکردنی هەموو جۆرەکانی ریکلام
  Future<void> _loadAds() async {
    await _adManager.loadBannerAd();
    await _adManager.loadInterstitialAd();
    await _adManager.loadRewardedAd();
    setState(() {});
  }

  @override
  void dispose() {
    _adManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نموونەی ریکلامەکانی گۆگڵ'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          // ناوەڕۆکی سەرەکی
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
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
                      'خاڵەکانت: $_rewardPoints 🎁',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // دوگمەی ئینتەرستیشڵ ئاد
                    ElevatedButton.icon(
                      onPressed: _adManager.isInterstitialAdLoaded
                          ? () => _adManager.showInterstitialAd()
                          : null,
                      icon: const Icon(Icons.fullscreen),
                      label: const Text('نیشاندانی ریکلامی تەواو'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // دوگمەی ریواردید ئاد
                    ElevatedButton.icon(
                      onPressed: _adManager.isRewardedAdLoaded
                          ? () {
                              _adManager.showRewardedAd(
                                onReward: (amount, type) {
                                  setState(() {
                                    _rewardPoints += amount;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '🎉 $amount خاڵت وەرگرت!',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      backgroundColor: Colors.green,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                              );
                            }
                          : null,
                      icon: const Icon(Icons.card_giftcard),
                      label: const Text('بینینی ریکلام بۆ خاڵ'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // دۆخی ریکلامەکان
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            _buildAdStatus(
                              'بانەر',
                              _adManager.isBannerAdLoaded,
                            ),
                            const Divider(),
                            _buildAdStatus(
                              'ئینتەرستیشڵ',
                              _adManager.isInterstitialAdLoaded,
                            ),
                            const Divider(),
                            _buildAdStatus(
                              'ریواردید',
                              _adManager.isRewardedAdLoaded,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // بانەر ئاد لە خوارەوە
          if (_adManager.isBannerAdLoaded && _adManager.bannerAd != null)
            Container(
              alignment: Alignment.bottomCenter,
              width: _adManager.bannerAd!.size.width.toDouble(),
              height: _adManager.bannerAd!.size.height.toDouble(),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: AdWidget(ad: _adManager.bannerAd!),
            ),
        ],
      ),
    );
  }

  Widget _buildAdStatus(String title, bool isLoaded) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        Row(
          children: [
            Icon(
              isLoaded ? Icons.check_circle : Icons.pending,
              color: isLoaded ? Colors.green : Colors.orange,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              isLoaded ? 'ئامادەیە' : 'بارکردن...',
              style: TextStyle(
                color: isLoaded ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

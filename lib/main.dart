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
          const SizedBox(height: 100),
          const Text(
            textAlign: TextAlign.center,
            'بۆ دەسکەوتنی لینکی پرۆژەکە سەردانی ئەکاونتی گیتهەبەکەم\n بکە لینکی لە چەنالی تیلیگرام دادەنێم',
            style: TextStyle(fontSize: 16),
          ),
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
                    onPressed: _adManager.isRewardedAdLoaded
                        ? _showRewardAd
                        : null,
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

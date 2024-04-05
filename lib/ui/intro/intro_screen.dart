import 'package:anatomy_ar/const/app_scafford.dart';
import 'package:anatomy_ar/const/ar_color.dart';
import 'package:anatomy_ar/const/ar_image.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:anatomy_ar/home/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          ImageSlideshow(
            disableUserScrolling: true,
            height: MediaQuery.of(context).size.height * 0.7,

            initialPage: 0,

            /// The color to paint the indicator.
            indicatorColor: OneColors.brandVNPT,

            /// The color to paint behind th indicator.
            indicatorBackgroundColor: OneColors.grey,

            /// Called whenever the page in the center of the viewport changes.
            onPageChanged: (value) {
              if (value == 2) {
                Future.delayed(const Duration(seconds: 2), (() {
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeTabs()));
                  });
                }));
              }
            },

            autoPlayInterval: 1500,

            isLoop: false,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Text(
                      'Hỗ trợ trực quan việc học giải phẫu',
                      style: OneTheme.of(context).body1.copyWith(fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Image.asset(
                      ArImages.intro_1,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Text(
                      'Quét ảnh hiển thị mô hình 3D trong không gian thực',
                      style: OneTheme.of(context).body1.copyWith(fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(
                    ArImages.intro_2,
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Hỗ trợ hiển thị mô hình 3D trên mặt phẳng',
                      style: OneTheme.of(context).body1.copyWith(fontSize: 28),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Image.asset(
                    ArImages.intro_3,
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            'Xin chào',
            style: OneTheme.of(context).body1.copyWith(fontSize: 28),
          ),
          Lottie.asset(
            "assets/animation/loading.json",
            width: 110,
            height: 110,
            repeat: true,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:anatomy_ar/cache_image.dart/cache_image.dart';
import 'package:anatomy_ar/const/ar_color.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:anatomy_ar/const/ramdom_color.dart';
import 'package:flutter/material.dart';

class ItemListAnotomy extends StatelessWidget {
  const ItemListAnotomy(
      {super.key, required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    var indexRandom = random.nextInt(ColorRamdom.animalColor.length);

    return Container(
      height: 100,
      margin: const EdgeInsets.only(left: 6, right: 6, top: 5, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorRamdom.animalColor[indexRandom]),
      child: Row(
        children: [
          SizedBox(
            width: 51,
            child: CachedImage(imageUrl: imageUrl, fit: BoxFit.contain),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: OneTheme.of(context).title2.copyWith(fontSize: 18),
              ),
              Text(
                'Đầu',
                style: OneTheme.of(context)
                    .title2
                    .copyWith(fontSize: 16, color: OneColors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

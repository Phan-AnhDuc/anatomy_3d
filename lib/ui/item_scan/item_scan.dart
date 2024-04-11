import 'dart:math';

import 'package:anatomy_ar/cache_image.dart/cache_image.dart';
import 'package:anatomy_ar/const/ar_color.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:anatomy_ar/const/ramdom_color.dart';
import 'package:flutter/material.dart';

class ItemScanAr extends StatefulWidget {
  const ItemScanAr({super.key, required this.title, required this.descreption, required this.imageUrl});

  final String title;
  final String descreption;
  final String imageUrl;

  @override
  State<ItemScanAr> createState() => _ItemScanArState();
}

class _ItemScanArState extends State<ItemScanAr> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    var indexRandom = random.nextInt(ColorRamdom.animalColor.length);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: ColorRamdom.animalColor[indexRandom],
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: OneTheme.of(context).title1.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.descreption,
                    style: OneTheme.of(context).title2.copyWith(fontSize: 14, color: OneColors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
                width: 90,
                child: CachedImage(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:anatomy_ar/cache_image.dart/cache_image.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:anatomy_ar/const/constant.dart';
import 'package:anatomy_ar/home/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListAnotomy extends StatefulWidget {
  const ItemListAnotomy(
      {super.key, required this.arguments, required this.argumentsList});

  final arguments;
  final argumentsList;

  @override
  State<ItemListAnotomy> createState() => _ItemListAnotomyState();
}

class _ItemListAnotomyState extends State<ItemListAnotomy> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.detailScreen.name, arguments: [
          widget.arguments,
          widget.argumentsList,
          FromRoute.listItem,
          _title()
        ]);
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(left: 6, right: 6, top: 5, bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 245, 245, 245)),
        child: Row(
          children: [
            SizedBox(
              width: 51,
              child: CachedImage(
                  imageUrl: widget.arguments['imageUrl'], fit: BoxFit.contain),
            ),
            const SizedBox(width: 15),
            Text(
              '${widget.arguments['name']}',
              style: OneTheme.of(context).title2.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  String _title() {
    switch (widget.arguments['id']) {
      case '1':
        return 'Đầu';
      case '2':
        return 'Thân';
      case '3':
        return 'Chi trên';
      case '4':
        return 'Chi dưới';
    }
    return '';
  }
}

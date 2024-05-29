import 'package:anatomy_ar/cache_image.dart/cache_image.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:flutter/material.dart';

class ItemListAnotomy extends StatelessWidget {
  const ItemListAnotomy({super.key, required this.name, required this.imageUrl, required this.onTap});

  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(left: 6, right: 6, top: 5, bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color.fromARGB(255, 245, 245, 245)),
        child: Row(
          children: [
            SizedBox(
              width: 51,
              child: CachedImage(imageUrl: imageUrl, fit: BoxFit.contain),
            ),
            const SizedBox(width: 15),
            Text(
              name,
              style: OneTheme.of(context).title2.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}

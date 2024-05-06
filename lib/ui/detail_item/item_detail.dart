import 'package:anatomy_ar/cache_image.dart/cache_image.dart';
import 'package:anatomy_ar/const/ar_color.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:anatomy_ar/ui/detail_anatomy/detail_screen.dart';
import 'package:flutter/material.dart';

class ItemDetailAnotomy extends StatelessWidget {
  const ItemDetailAnotomy(
      {Key? key, required this.arguments, required this.argumentsList})
      : super(key: key);

  final arguments;
  final argumentsList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(
              arguments: arguments, argumentsList: argumentsList);
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: OneColors.xam,
          boxShadow: [
            BoxShadow(
              color: OneColors.boxshadow.withOpacity(0.3),
              offset: Offset(0, 5),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Hero(
              tag: 'image',
              child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 90,
                    child: CachedImage(
                        imageUrl: arguments['imageUrl'] ?? '',
                        fit: BoxFit.contain),
                  )),
            ),
            const SizedBox(height: 15),
            Text(
              '${arguments['name']}',
              style: OneTheme.of(context).title2.copyWith(
                    fontSize: 18,
                    color: OneColors.black,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

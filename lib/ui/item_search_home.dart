import 'package:anatomy_ar/cache_image.dart/cache_image.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:anatomy_ar/ui/detail_anatomy/detail_screen.dart';
import 'package:flutter/material.dart';

class ItemSearchHomePage extends StatefulWidget {
  const ItemSearchHomePage(
      {super.key, required this.arguments, required this.argumentsList});

  final arguments;
  final argumentsList;

  @override
  State<ItemSearchHomePage> createState() => _ItemSearchHomePageState();
}

class _ItemSearchHomePageState extends State<ItemSearchHomePage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(
            arguments: widget.arguments,
            argumentsList: widget.argumentsList,
            title: _title(),
          );
        }));
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
            ),
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

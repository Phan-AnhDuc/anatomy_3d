import 'package:anatomy_ar/cache_image.dart/cache_image.dart';
import 'package:anatomy_ar/const/app_scafford.dart';
import 'package:anatomy_ar/const/ar_color.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:anatomy_ar/const/sliver_app_bar_delegate.dart';
import 'package:anatomy_ar/ui/detail_item/item_list.dart';
import 'package:flutter/material.dart';
import 'package:native_ar_viewer/native_ar_viewer.dart';
import 'dart:io' as io;

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.arguments, required this.argumentsList});

  final arguments;
  final argumentsList;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final ScrollController _scrollController = ScrollController();

  _launchAR(String model3DUrl) async {
    if (io.Platform.isAndroid) {
      await NativeArViewer.launchAR(model3DUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Platform not supported')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isHideStatus: false,
      backgroundColor: OneColors.background,
      statusBarIconStyle: StatusBarIconStyle.light,
      body: Stack(
        children: [
          Scrollbar(
            child: CustomScrollView(controller: _scrollController, physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: <Widget>[
              _buildHeader(),
              SliverToBoxAdapter(child: _buildDescreption()),
              SliverToBoxAdapter(child: _buildListRelated()),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final double headerHeight = 325 + MediaQuery.of(context).padding.top;
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        child: _buildHeaderBody(),
        maxHeight: headerHeight,
        minHeight: headerHeight,
      ),
    );
  }

  Widget _buildHeaderBody() {
    return Stack(
      children: [
        Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: const BoxDecoration(
            color: OneColors.brandVNPT,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: OneColors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.arguments['name']}',
                    style: OneTheme.of(context).title2.copyWith(fontSize: 18, color: OneColors.white),
                  ),
                  Text(
                    'Circulatory system',
                    style: OneTheme.of(context).title2.copyWith(fontSize: 14, color: OneColors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.only(bottom: 30, top: 10),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: OneColors.white,
              boxShadow: const [
                BoxShadow(
                  color: OneColors.grey,
                  offset: Offset(0, 5),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: CachedImage(imageUrl: widget.arguments['imageUrl'], fit: BoxFit.contain),
            ),
          ),
        ),
        Positioned(
          top: 275,
          left: 120,
          right: 120,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: OneColors.brandVNPT,
            ),
            child: InkWell(
              onTap: () {
                _launchAR(widget.arguments["image3DUrl"]);
              },
              child: Center(
                child: Text(
                  'View in AR',
                  style: OneTheme.of(context).title2.copyWith(color: OneColors.white, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDescreption() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About heart',
                style: OneTheme.of(context).title2.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    'More',
                    style: OneTheme.of(context).title2.copyWith(fontSize: 14),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: OneColors.grey,
                    size: 14,
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          Text(
            '${widget.arguments['descreption']}',
            textAlign: TextAlign.justify,
            style: OneTheme.of(context).title2.copyWith(fontSize: 14, color: OneColors.grey),
          )
        ],
      ),
    );
  }

  Widget _buildListRelated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Related',
            style: OneTheme.of(context).title2.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 26),
          itemCount: widget.argumentsList.length,
          itemBuilder: (context, index) {
            return ItemListAnotomy(name: widget.argumentsList[index]['name'], imageUrl: widget.argumentsList[index]['imageUrl']);
          },
        ),
      ],
    );
  }
}

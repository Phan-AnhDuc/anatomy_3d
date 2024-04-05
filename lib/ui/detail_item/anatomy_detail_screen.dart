import 'package:anatomy_ar/const/app_scafford.dart';
import 'package:anatomy_ar/const/ar_color.dart';
import 'package:anatomy_ar/const/ar_theme.dart';
import 'package:anatomy_ar/const/sliver_app_bar_delegate.dart';
import 'package:anatomy_ar/firebase/fire_base.dart';
import 'package:anatomy_ar/ui/detail_item/item_detail.dart';
import 'package:flutter/material.dart';

class AnotomyDetailScreen extends StatefulWidget {
  const AnotomyDetailScreen({super.key, required this.id});

  final int id;

  @override
  State<AnotomyDetailScreen> createState() => _AnotomyDetailScreenState();
}

class _AnotomyDetailScreenState extends State<AnotomyDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _dataList = [];
  @override
  void initState() {
    super.initState();
    _layDanhSachBoPhan();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        color: OneColors.brandVNP,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Scrollbar(
                child: CustomScrollView(controller: _scrollController, physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: <Widget>[
                  _buildHeader(),
                  _buildTitle('Hệ thống xương'),
                  _buildBodyFirstId('1'),
                  _buildTitle(_titleSecond()),
                  _buildBodyFirstId('2'),
                  _buildTitle(_titleThird()),
                  _buildBodyFirstId('3'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.arrow_back,
                    color: OneColors.white,
                    size: 24,
                  ),
                ),
              ),
              Text(
                _title(),
                style: OneTheme.of(context).title2.copyWith(fontSize: 18, color: OneColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        child: _buildHeaderBody(),
        maxHeight: 70,
        minHeight: 0,
      ),
    );
  }

  SliverToBoxAdapter _buildBodyFirstId(String? id) {
    final List<Map<String, dynamic>> filteredItems = _dataList.where((item) => item['id'] == id).toList();
    return SliverToBoxAdapter(
      child: GridView.count(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(
          filteredItems.length,
          (index) {
            return ItemDetailAnotomy(
              arguments: filteredItems[index],
              argumentsList: _dataList,
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTitle(String? title) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Text(
          title ?? '',
          style: OneTheme.of(context).title2.copyWith(fontSize: 14, color: OneColors.white),
        ),
      ),
    );
  }

  String _title() {
    switch (widget.id) {
      case 1:
        return 'Đầu';
      case 2:
        return 'Thân';
      case 3:
        return 'Chi trên';
      case 4:
        return 'Chi dưới';
    }
    return '';
  }

  void _layDanhSachBoPhan() {
    switch (widget.id) {
      case 1:
        layDanhSachDau().then((data) {
          setState(() {
            _dataList = data;
          });
        });
      case 2:
        layDanhSachThan().then((data) {
          setState(() {
            _dataList = data;
          });
        });
      case 3:
        layDanhSachChiTren().then((data) {
          setState(() {
            _dataList = data;
          });
        });
      case 4:
        layDanhSachChiDuoi().then((data) {
          setState(() {
            _dataList = data;
          });
        });
    }
  }

  String _titleSecond() {
    switch (widget.id) {
      case 1:
      case 2:
        return 'Hệ thống thần kinh';
      case 3:
      case 4:
        return '';
    }
    return '';
  }

  String _titleThird() {
    switch (widget.id) {
      case 1:
        return 'Hệ thống giác quan';
      case 2:
        return 'Hệ thống hô hấp';
      case 3:
      case 4:
        return '';
    }
    return '';
  }
}
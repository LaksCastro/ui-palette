import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_palette_example/navigation/app_navigator.dart' as navigator;
import 'package:ui_palette_example/ui/constants/dp.dart';
import 'package:ui_palette_example/ui/widgets/app_bar_action.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../navigation/module_navigator.dart';
import '../../navigation/tab_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  void _openFilterBottomSheet() {}

  @override
  Widget build(BuildContext context) {
    final overlayColor =
        Theme.of(context).bottomNavigationBarTheme.backgroundColor;
    final overlayBrightness = Theme.of(context).brightness;

    final overlayIconBrightness = overlayBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    return TabNavigator(
      moduleNavigator: ModuleNavigator.home,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: overlayColor,
            statusBarColor: overlayColor, // status bar color
            statusBarBrightness: overlayBrightness, //status bar brigtness
            statusBarIconBrightness: overlayIconBrightness,
            systemNavigationBarDividerColor: overlayColor,
            systemNavigationBarIconBrightness: overlayIconBrightness,
          ),
          child: RefreshIndicator(
            displacement: kToolbarHeight,
            onRefresh: () async => {},
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  floating: true,
                  toolbarHeight: kToolbarHeight,
                  title: Opacity(opacity: 0.5, child: Text('Browse')),
                  actions: [
                    AppBarAction(
                      icon: Icon(Icons.filter_list_rounded),
                      onTap: _openFilterBottomSheet,
                    ),
                  ],
                ),
                SliverPadding(
                  padding: EdgeInsets.all(k1dp),
                  sliver: HomeImageList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeImageList extends StatefulWidget {
  const HomeImageList({
    Key key,
  }) : super(key: key);

  @override
  _HomeImageListState createState() => _HomeImageListState();
}

class _HomeImageListState extends State<HomeImageList> {
  static const _cardWidth = 150.0;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width ~/ _cardWidth,
        mainAxisSpacing: k1dp,
        crossAxisSpacing: k1dp,
        childAspectRatio: 1 / 1.5,
      ),
      delegate: SliverChildBuilderDelegate(
        (_, index) {
          return Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(k1dp),
              onTap: () {},
              child: Image.network(
                'https://picsum.photos/seed/picsum/200/300',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

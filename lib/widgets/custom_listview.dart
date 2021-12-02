import 'dart:developer';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatefulWidget {
  const CustomListView(
      {this.header,
      this.children,
      this.thresholdOffset,
      this.appBarColor,
      Key? key})
      : super(key: key);

  final String? header;
  final List<Widget>? children;
  final Color? appBarColor;
  final double? thresholdOffset;

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  final topOffsetNotifier = ValueNotifier<double>(0);
  late final double thresholdOffset;

  @override
  void initState() {
    thresholdOffset = widget.thresholdOffset ?? 28.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dummyChildren = [
      _buildTitle(),
      _buildContainer(Theme.of(context).focusColor),
      _buildContainer(Theme.of(context).highlightColor),
      _buildContainer(Theme.of(context).primaryColor),
      _buildContainer(Theme.of(context).bottomAppBarColor),
    ];

    return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Theme.of(context).backgroundColor,
        body: NotificationListener(
          onNotification: (ScrollNotification n) {
            topOffsetNotifier.value = n.metrics.pixels;
            return true;
          },
          child: ListView(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 10),
              shrinkWrap: true,
              children: widget.children ?? dummyChildren),
        ));
  }

  _buildAppBar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: ValueListenableBuilder<double>(
            valueListenable: topOffsetNotifier,
            builder: (c, topOffset, child) {
              if (topOffset > thresholdOffset) topOffset = thresholdOffset;
              return AppBar(
                elevation: topOffset >= thresholdOffset ? 3 : 0,
                backgroundColor:
                    widget.appBarColor ?? Theme.of(context).backgroundColor,
                leading:
                    const Icon(EvaIcons.arrowBackOutline, color: Colors.black),
                title: Text(widget.header ?? 'Dummy Page',
                    style: TextStyle(
                        color: Colors.black
                            .withOpacity(topOffset / thresholdOffset))),
              );
            }));
  }

  Widget _buildTitle() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(widget.header ?? 'Dummy Page',
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
      const Text('This is a description for the content in this page.',
          style: TextStyle(color: Colors.black)),
    ]);
  }

  Widget _buildContainer(Color color) {
    return Container(
        height: 400,
        width: 400,
        color: color,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: const Text('This is the dummy container'));
  }
}

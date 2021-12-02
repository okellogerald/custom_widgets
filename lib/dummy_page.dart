import 'package:flutter/material.dart';

import 'widgets/custom_listview.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({Key? key}) : super(key: key);

  static navigateTo(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const DummyPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const CustomListView();
  }
}

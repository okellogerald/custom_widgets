import 'dart:developer';

import 'package:custom_widgets/dummy_page.dart';
import 'package:custom_widgets/widgets/custom_image_button.dart';
import 'package:custom_widgets/widgets/source.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              _icon(),
              const SizedBox(height: 40),
              _iconButton(),
              const SizedBox(height: 40),
              _flatButton(),
              const SizedBox(height: 40),
              const CustomImageButton()
            ]),
          )),
    );
  }

  _icon() {
    return Builder(builder: (context) {
      return SizedBox(
        height: 22,
        child: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashColor: Colors.grey,
            icon: const Icon(EvaIcons.award, size: 22, color: Colors.black)),
      );
    });
  }

  _iconButton() {
    return Builder(builder: (context) {
      return CustomIconButton(
        radius: 60,
        iconSize: 25,
        onPressed: () => log('hello there'),
      );
    });
  }

  _flatButton() {
    return Builder(builder: (context) {
      return CustomTextButton(
        borderColor: Colors.grey,
        onPressed: () => log('hello there'),
      );
    });
  }
}

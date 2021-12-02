import 'dart:developer';
import 'package:flutter/material.dart';

class CustomImageButton extends StatefulWidget {
  const CustomImageButton(
      {this.image, this.size, this.onPressed, this.splashColor, Key? key})
      : super(key: key);

  final Widget? image;
  final double? size;
  final VoidCallback? onPressed;
  final Color? splashColor;

  @override
  _CustomImageButtonState createState() => _CustomImageButtonState();
}

class _CustomImageButtonState extends State<CustomImageButton> {
  late final double size;

  @override
  void initState() {
    size = widget.size ?? 200;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          widget.image ??
              Image.network(
                  'https://images.pexels.com/photos/1475234/pexels-photo-1475234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  fit: BoxFit.fill),
          Material(
              elevation: 0,
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onPressed ?? () => log('hello there'),
                splashColor:
                    widget.splashColor ?? Theme.of(context).splashColor,
              )),
        ],
      ),
    );
  }
}

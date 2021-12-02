import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton(
      {this.buttonColor = Colors.transparent,
      this.highlightColor = const Color(0xffF2F1F0),
      this.icon,
      this.iconColor,
      this.radius,
      this.iconSize,
      required this.onPressed,
      this.duration = const Duration(milliseconds: 200),
      Key? key})
      : super(key: key);

  final Color buttonColor;
  final Color highlightColor;
  final IconData? icon;
  final Color? iconColor;
  final double? radius;
  final double? iconSize;
  final VoidCallback onPressed;
  final Duration duration;

  static Widget small(
      {double size = 22,
      Color splashColor = Colors.grey,
      IconData icon = EvaIcons.award,
      EdgeInsetsGeometry margin = EdgeInsets.zero,
      required VoidCallback onPressed}) {
    return Container(
      height: size,
      margin: margin,
      child: IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          splashColor: splashColor,
          icon: Icon(icon, size: size, color: Colors.black)),
    );
  }

  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<Color?> animation;
  late final double radius;

  @override
  void initState() {
    controller = AnimationController(
        duration: widget.duration,
        reverseDuration: const Duration(milliseconds: 0),
        vsync: this);
    animation =
        ColorTween(begin: widget.buttonColor, end: widget.highlightColor)
            .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.onPressed();
              controller.reverse();
            }
          });
    radius = widget.radius ?? 60;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: _child(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => controller.forward(),
          child: Container(
              height: radius,
              width: radius,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: animation.value,
              ),
              alignment: Alignment.center,
              child: _child()),
        );
      },
    );
  }

  _child() {
    return Icon(widget.icon ?? EvaIcons.home,
        size: widget.iconSize ?? 20, color: widget.iconColor ?? Colors.black);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

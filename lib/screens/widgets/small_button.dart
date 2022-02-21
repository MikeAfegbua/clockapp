import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {required this.ontap,
      required this.width,
      required this.child,
      required this.innerColor,
      Key? key})
      : super(key: key);
  final Function() ontap;
  final double width;
  final Widget child;
  final Color innerColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: child,
      onPressed: ontap,
      shape: const CircleBorder(
        side: BorderSide(width: 1, color: Colors.white),
      ),
      fillColor: innerColor,
      constraints: BoxConstraints(maxWidth: width),
    );
  }
}

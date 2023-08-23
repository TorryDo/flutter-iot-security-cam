import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/utils/const.dart';

class TransparentCard extends StatelessWidget {
  final Widget child;

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const TransparentCard(
      {Key? key,
      required this.child,
      this.width,
      this.height,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 100,
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(20.0)),
        color: Colors.black.withOpacity(Const.buttonOpacity),
      ),
      child: Padding(padding: const EdgeInsets.all(10.0), child: child),
    );
  }
}

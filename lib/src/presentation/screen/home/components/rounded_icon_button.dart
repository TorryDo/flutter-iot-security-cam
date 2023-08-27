import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/utils/const.dart';
import 'package:flutter_svg/svg.dart';

class RoundedIconButton extends StatelessWidget {
  final String icon;
  final bool isSelected;
  final GestureTapCallback onTap;
  final double size;

  const RoundedIconButton(
      {Key? key,
      required this.icon,
      required this.isSelected,
      required this.onTap,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final iconColor = isSelected ? Colors.black : Colors.white;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          color: isSelected ? Colors.white : Colors.black.withOpacity(Const.buttonOpacity),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn) ,
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }
}

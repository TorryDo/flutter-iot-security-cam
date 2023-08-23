import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/common/widgets/transparent_card.dart';
import 'package:flutter_iot_security_cam/config/size_config.dart';
import 'package:flutter_svg/svg.dart';

class SwitchCard extends StatelessWidget {
  final String svgLocation;
  final VoidCallback onClick;
  final String title;
  final String description;
  final bool isEnabled;
  final Function(bool) onChanged;

  final double? width;
  final double? height;

  const SwitchCard({
    Key? key,
    required this.svgLocation,
    required this.onClick,
    required this.title,
    required this.description,
    required this.isEnabled,
    required this.onChanged,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: TransparentCard(
        // width: width ?? getProportionateScreenWidth(120),
        // height: height ?? getProportionateScreenHeight(110),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(2),
            vertical: getProportionateScreenHeight(5)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      svgLocation,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 30,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CupertinoSwitch(
                        value: isEnabled,
                        onChanged: onChanged,
                        trackColor: Colors.black38,
                      ),
                    ),
                  )
                ],
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

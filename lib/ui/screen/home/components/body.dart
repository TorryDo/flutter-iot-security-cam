import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/ui/screen/home/components/rounded_icon_button.dart';
import 'package:flutter_iot_security_cam/ui/screen/home/components/switch_card.dart';
import 'package:flutter_iot_security_cam/ui/screen/home/home_provider.dart';
import 'package:flutter_iot_security_cam/utils/lib/provider/provider_ext.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = context.provider();

    const mHorPadding = 10.0;

    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: mHorPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedIconButton(
                icon: 'assets/icons/battery.svg',
                isSelected: homeProvider.isInSaveEnergyEnabled,
                onTap: () {
                  homeProvider.toggleSaveEnergyState();
                  homeProvider.setProgressVal(Random().nextDouble());
                },
                size: 24,
              ),
              RoundedIconButton(
                icon: 'assets/icons/microphone.svg',
                isSelected: false,
                onTap: () {},
                size: 24,
              ),
              RoundedIconButton(
                icon: 'assets/icons/camera.svg',
                isSelected: false,
                onTap: () {},
                size: 24,
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          width: double.infinity,

          child: Center(
            child: ElevatedButton(
              onPressed: () {
                homeProvider.toggle();
              },
              child: Text('switch ${homeProvider.isActivated}', style: const TextStyle(color: Colors.black),),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.symmetric(horizontal: mHorPadding),
              crossAxisCount: 2,
              children: [
                SwitchCard(
                  svgLocation: 'assets/icons/people.svg',
                  onClick: () {},
                  title: 'People',
                  description: '23 peoples',
                  isEnabled: homeProvider.isPeopleAccessEnabled,
                  onChanged: (b) {
                    homeProvider.togglePeopleAccessState();
                  },
                ),
                SwitchCard(
                  svgLocation: 'assets/icons/ticket.svg',
                  onClick: () {},
                  title: 'Access Code',
                  description: '3 codes is active',
                  isEnabled: homeProvider.isAccessCodeEnabled,
                  onChanged: (b) {
                    homeProvider.toggleAccessCodeState();
                  },
                ),
                SwitchCard(
                  svgLocation: 'assets/icons/notification.svg',
                  onClick: () {},
                  title: 'Notification',
                  description: 'display on notification tray',
                  isEnabled: homeProvider.isActivated,
                  onChanged: (b) {
                    homeProvider.toggle();
                  },
                ),
              ]),
        ),
      ],
    );
  }
}

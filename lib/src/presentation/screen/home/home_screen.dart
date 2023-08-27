import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/utils/lib/provider/provider_ext.dart';
import 'package:flutter_iot_security_cam/utils/slider_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rainbow_color/rainbow_color.dart';

import 'components/body.dart';
import 'components/options_enum.dart';
import 'components/widgets/slider_widget.dart';
import 'home_provider.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  Options option = Options.cooling;
  bool isActive = false;
  int speed = 1;
  double temp = 22.85;


  var activeColor = Rainbow(spectrum: [
    const Color(0xFF33C0BA),
    const Color(0xFF1086D4),
    const Color(0xFF6D04E2),
    const Color(0xFFC421A0),
    const Color(0xFFE4262F)
  ], rangeStart: 0.0, rangeEnd: 1.0);

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = context.provider();

    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.white,
                activeColor[homeProvider.progressVal].withOpacity(0.5),
                activeColor[homeProvider.progressVal]
              ]),
        ),
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: ParticleOptions(
            baseColor: const Color(0xFFFFFFFF),
            opacityChangeRate: 0.25,
            minOpacity: 0.1,
            maxOpacity: 0.3,
            spawnMinSpeed: speed * 60.0,
            spawnMaxSpeed: speed * 120,
            spawnMinRadius: 2.0,
            spawnMaxRadius: 5.0,
            particleCount: isActive ? speed * 150 : 0,
          )),
          vsync: this,
          child: SafeArea(
            child: Scaffold(
              appBar: myAppBar(),
              backgroundColor: Colors.transparent,
              body: const Body(),
            ),
          ),
        ),
      ),
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Secure Camera',
        style: TextStyle(color: Colors.black87),
      ),
      actions: [
        SvgPicture.asset(
          'assets/icons/menu.svg',
          width: 24,
          height: 24,
        ),
      ],
    );
  }

  Widget slider(double progressVal) {
    return SliderWidget(
      progressVal: progressVal,
      color: activeColor[progressVal],
      onChange: (value) {
        setState(() {
          temp = value;
          progressVal = normalize(value, kMinDegree, kMaxDegree);
        });
      },
    );
  }
}

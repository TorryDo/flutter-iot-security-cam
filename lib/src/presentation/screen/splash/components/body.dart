import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/config/size_config.dart';
import 'package:flutter_iot_security_cam/di/locator.dart';
import 'package:flutter_iot_security_cam/src/domain/auth/repository/auth_repository.dart';
import 'package:flutter_iot_security_cam/src/presentation/screen/home/home_screen.dart';
import 'package:flutter_iot_security_cam/src/presentation/screen/login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF464646),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Material(
            color: Colors.transparent,
            child: Image.asset('assets/images/splash_img.png'),
          ),
          Text(
            'Sweet & Smart Home',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            'Smart Home can change\nway you live in the future',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: const Color(0xFFBDBDBD),
                ),
          ),
          ElevatedButton(
            onPressed: () {
              navigate(context);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(70),
                vertical: getProportionateScreenHeight(15),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // <-- Radius
              ),
            ),
            child: Text(
              'Get Started',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }

  void navigate(BuildContext context) {
    final AuthRepository authRepository = locator();

    authRepository.getCurrentUserAccount().then((value) {
      if (value == null) {
        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      }
    });
  }
}

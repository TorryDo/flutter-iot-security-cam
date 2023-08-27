import 'package:flutter/material.dart';
import 'package:flutter_iot_security_cam/config/size_config.dart';
import 'package:flutter_iot_security_cam/src/presentation/screen/home/home_screen.dart';
import 'package:flutter_iot_security_cam/src/presentation/screen/login/login_provider.dart';
import 'package:flutter_iot_security_cam/utils/lib/provider/provider_ext.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginProvider loginProvider = context.provider();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.asset(
              'assets/images/login.png',
              height: getProportionateScreenHeight(300),
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
                bottom: getProportionateScreenHeight(20),
                left: getProportionateScreenWidth(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SMART',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.black, fontSize: 33),
                    ),
                    Text(
                      'HOME',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.black, fontSize: 64),
                    )
                  ],
                )),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Text(
            'sign into \nmange your device & accessory',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: loginProvider.emailController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                hintText: 'Email',
                suffixIcon: const Icon(
                  Icons.email,
                  color: Colors.black,
                )),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: loginProvider.passwordController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 40.0, right: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(70.0),
                ),
                hintText: 'Password',
                suffixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black,
                )),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20)),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: GestureDetector(
            onTap: () {
              loginClick(context, loginProvider);
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF464646),
                borderRadius: BorderRadius.circular(70.0),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        const Center(child: Text('Don\'t have an account yet?'))
      ],
    );
  }

  void loginClick(BuildContext context, LoginProvider loginProvider) {
    loginProvider.login().then((value) {
      if (value != null) {
        print(value);
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      }else{
        print('tk pass is not correct');
      }
    });
  }
}

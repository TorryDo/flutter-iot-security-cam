import 'package:flutter_iot_security_cam/src/domain/domain_module.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> setupLocator() async {
  domainModule();
}
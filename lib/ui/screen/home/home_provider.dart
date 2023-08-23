import 'package:flutter/cupertino.dart';
import 'package:flutter_iot_security_cam/common/utils/lang/bool_ext.dart';

class HomeProvider extends ChangeNotifier {
  bool isActivated = false;

  bool isInSaveEnergyEnabled = false;
  bool isPeopleAccessEnabled = true;
  bool isAccessCodeEnabled = true;
  bool isNotificationEnabled = false;

  double progressVal = 0.5;

  void setProgressVal(double value) {
    progressVal = value;
    notifyListeners();
  }

  void toggle() {
    isActivated = isActivated.not();
    notifyListeners();
  }

  void toggleSaveEnergyState() {
    isInSaveEnergyEnabled = isInSaveEnergyEnabled.not();
    notifyListeners();
  }

  void togglePeopleAccessState() {
    isPeopleAccessEnabled = isPeopleAccessEnabled.not();
    notifyListeners();
  }

  void toggleAccessCodeState() {
    isAccessCodeEnabled = isAccessCodeEnabled.not();
    notifyListeners();
  }

  void toggleNotificationState() {
    isNotificationEnabled = isNotificationEnabled.not();
    notifyListeners();
  }
}

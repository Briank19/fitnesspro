import 'package:get/get.dart';

class SettingsController extends GetxController {
  final _isDarkMode = false.obs;
  final _isNotification = false.obs;
  bool get isDarkMode => _isDarkMode.value;
  bool get isNotification => _isNotification.value;

  void changeDarkMode(bool value) {
    _isDarkMode.value = value;
  }

  void changeNotification(bool value) {
    _isNotification.value = value;
  }
}

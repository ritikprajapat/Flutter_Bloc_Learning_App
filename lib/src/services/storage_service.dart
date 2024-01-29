import 'package:learning_app/src/app/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _preferences.getBool(AppConstants.deviceFirstOpen) ?? false;
  }

  bool getIsLoggedIn() {
    return _preferences.getString(AppConstants.userToken) == null ? false : true;
  }
}

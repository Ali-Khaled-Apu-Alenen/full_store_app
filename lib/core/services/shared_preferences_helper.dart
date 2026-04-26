import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();
  static removeData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  static clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }
  static  getString(String key)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
  static  getInt(String key)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key);
  }
  static  getBool(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key);
  }
  static  getDouble(String key)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key);
  }
}

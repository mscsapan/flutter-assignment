import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  final String saveDataKey = "SAVEDATAKEY";

  getData() async {
    SharedPreferences saveData = await SharedPreferences.getInstance();
    saveData.getString(saveDataKey);
  }

  saveData(String data) async {
    SharedPreferences saveData = await SharedPreferences.getInstance();
    saveData.setString(saveDataKey, data);
  }
}

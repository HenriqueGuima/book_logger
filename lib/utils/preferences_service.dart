import 'dart:developer';
import '../utils/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future saveBool() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true);
  }

  Future saveString() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phoneNumber', globals.phoneNumberController.text);
    log('saving phone number as ${globals.phoneNumberController.text}');
  }
}

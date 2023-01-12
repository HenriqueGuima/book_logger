import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
Future<bool>? logged;
String? phoneNumber;
final phoneNumberController = TextEditingController();
String phoneGb = '';

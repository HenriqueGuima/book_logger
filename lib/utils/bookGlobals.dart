import 'package:flutter/material.dart';

final id = TextEditingController();
final bookTitle = TextEditingController();
final bookGenre = TextEditingController();
final bookRating = TextEditingController();
final bookAuthor = TextEditingController();
final bookPages = TextEditingController();
late var timePages = 0;
var bookTimeToRead;
int n = 0;

bool bookRead = false;
DateTime? dataReqSelect = null;
DateTime? dataReqSelectts = null;

String bookDateRead = '';
String bookTimeStarted = '';
final bookDescription = TextEditingController();

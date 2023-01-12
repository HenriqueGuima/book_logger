import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/books.dart';
import '../utils/bookGlobals.dart';
import '../utils/globals.dart';

class SaveBook {
  static Future<void> saveBook(
      bt, ba, bg, br, bp, bool brd, bdr, bd, ttr, ts) async {
    timePages = int.parse(bp) * 130; //EACH PAGE TAKES ABOUT 130 SECONDS TO READ

    bookTimeToRead = timePages;

    !brd ? n += 1 : n;

    log('${timePages}');
    try {
      if (phoneNumberController.text != '') {
        final docService = FirebaseFirestore.instance
            .collection(phoneNumberController.text)
            .doc('book $n');

        final book = Book(
          bookTitle: bt,
          bookAuthor: ba,
          bookGenre: bg,
          bookRating: br,
          bookPages: bp,
          bookRead: brd,
          bookDateRead: bdr,
          bookDescription: bd,
          bookTimeToRead: ttr,
          bookTimeStarted: ts,
        );

        final json = book.toJson();

        await docService.set(json);

        log(
          'Saved! \nTitle - $bt ',
        );
        resetFields();
      } else {
        final docService = phoneNumberController.text == ''
            ? FirebaseFirestore.instance.collection('books $n').doc('book $n')
            : FirebaseFirestore.instance
                .collection(phoneNumberController.text)
                .doc('book $n');

        final book = Book(
          bookTitle: bt,
          bookAuthor: ba,
          bookGenre: bg,
          bookRating: br,
          bookPages: bp,
          bookRead: brd,
          bookDateRead: bdr,
          bookDescription: bd,
          bookTimeToRead: ttr = timePages,
          bookTimeStarted: ts,
        );

        final json = book.toJson();

        await docService.set(json);

        log(
          'Saved! \Title - $bt  ',
        );
        resetFields();
      }
    } on Exception catch (e) {
      log('ERRO AO GUARDAR O SERVICO: $e');
    }
  }

  static resetFields() {
    bookTitle.clear();
    bookAuthor.clear();
    bookGenre.clear();
    bookRating.clear();
    bookPages.clear();
    bookRead = false;
    dataReqSelect = null;
    bookDateRead = '';
    bookTimeStarted = '';
    bookDescription.clear();

    log('Fields reset');
  }
}

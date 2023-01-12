import '../utils/bookGlobals.dart' as globals;

class CheckFields {
  static bool checkFields() {
    if (globals.bookTitle.text.isNotEmpty ||
        globals.bookAuthor.text.isNotEmpty ||
        globals.bookPages.text.isNotEmpty ||
        globals.bookGenre.text.isNotEmpty ||
        globals.bookRating.text.isNotEmpty ||
        globals.bookDescription.text.isNotEmpty ||
        globals.bookDateRead.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

import 'dart:developer';

class Book {
  String id;
  final String bookTitle;
  final String bookAuthor;
  final String bookPages;
  final bool bookRead;
  final String bookGenre;
  final String bookRating;
  String bookDateRead;
  final String bookDescription;
  final dynamic bookTimeToRead;
  final String bookTimeStarted;

  Book({
    this.id = '',
    required this.bookTitle,
    required this.bookAuthor,
    required this.bookPages,
    required this.bookRead,
    required this.bookGenre,
    required this.bookRating,
    required this.bookDateRead,
    required this.bookDescription,
    required this.bookTimeToRead,
    required this.bookTimeStarted,
  });

  Map<String, dynamic> toJson() => {
        'bookTitle': bookTitle,
        'bookAuthor': bookAuthor,
        'bookPages': bookPages,
        'bookRead': bookRead,
        'bookGenre': bookGenre,
        'bookRating': bookRating,
        'bookDateRead': bookDateRead,
        'bookDescription': bookDescription,
        'bookTimeToRead': bookTimeToRead,
        'bookTimeStarted': bookTimeStarted,
      };

  static Book fromJson(Map<String, dynamic> json) => Book(
        id: json['id'] ?? '',
        bookTitle: json['bookTitle'] ?? '',
        bookAuthor: json['bookAuthor'] ?? '',
        bookPages: json['bookPages'] ?? '',
        bookRead: json['bookRead'] ?? false,
        bookGenre: json['bookGenre'] ?? '',
        bookRating: json['bookRating'] ?? '',
        bookDateRead: json['bookDateRead'] ?? '',
        bookDescription: json['bookDescription'] ?? '',
        bookTimeToRead: json['bookTimeToRead'] ?? '',
        bookTimeStarted: json['bookTimeStarted'] ?? '',
      );
}

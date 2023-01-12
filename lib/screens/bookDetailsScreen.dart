// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../methods/saveBook.dart';
import '../models/books.dart';
import '../utils/bookGlobals.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({
    Key? key,
    required this.bookTitle,
    required this.bookPages,
    required this.bookRead,
    required this.book,
  }) : super(key: key);

  final String bookTitle;
  final String bookPages;
  final bool bookRead;
  final Book book;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   iconTheme: IconThemeData(
        //     color: Colors.black, //change your color here
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        //   title: Text(
        //       style: TextStyle(color: Colors.black),
        //       '${widget.bookTitle.toString()}'),
        // ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 226, 248),
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.all(10),
                  // color: Color.fromARGB(255, 218, 210, 216),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all<Size>(
                                      Size(65, 65),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                    side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                    elevation:
                                        MaterialStateProperty.all<double>(0),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 255, 200, 47),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '${widget.book.bookTitle.toUpperCase()} by ${widget.book.bookAuthor}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                      '${widget.book.bookPages.toUpperCase()} pages'),
                                  // Text(widget.book.bookRead ? 'Read' : 'Not Read'),
                                  widget.book.bookTimeToRead == '' ||
                                          widget.book.bookTimeToRead == null ||
                                          widget.book.bookTimeToRead == 'null'
                                      ? Text('Avg. time not available')
                                      : Text(
                                          'Avg. time to finish the book: ${widget.book.bookTimeToRead}'),
                                  Text(widget.book.bookTimeStarted
                                      .toUpperCase()),
                                  Text(widget.book.bookRead
                                      ? widget.book.bookDateRead.toUpperCase()
                                      : ''),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        persistentFooterButtons: [
          //update service

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !widget.book.bookRead
                  ? Expanded(
                      child: ElevatedButton(
                        child: Text('Mark as Finished!'),
                        onPressed: () {
                          setState(
                            () {
                              SaveBook.saveBook(
                                widget.book.bookTitle,
                                widget.book.bookGenre,
                                widget.book.bookRating,
                                widget.book.bookAuthor,
                                widget.book.bookPages,
                                true,
                                widget.book.bookDateRead =
                                    DateTime.now().toString(),
                                widget.book.bookDescription,
                                widget.book.bookTimeToRead,
                                widget.book.bookTimeStarted,
                              );
                            },
                          );
                          Navigator.pop(context);
                        },
                      ),
                    )
                  : Container(),
              // Expanded(
              //     child: ElevatedButton(
              //       style: ButtonStyle(
              //         backgroundColor:
              //             MaterialStateProperty.all<Color>(Colors.grey),
              //       ),
              //       child: Text('Finished!'),
              //       onPressed: () {},
              //     ),
              //   ),
            ],
          ),
        ],
      ),
    );
  }
}

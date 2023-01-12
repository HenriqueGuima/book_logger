// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:book_logger/main.dart';
import 'package:book_logger/models/books.dart';
import 'package:book_logger/screens/addBookScreen.dart';
import 'package:book_logger/screens/bookDetailsScreen.dart';
import 'package:book_logger/utils/bookGlobals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> _list = ['service1', 'service2', 'service3'];
  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Remove bool
    prefs.remove("login");
    prefs.remove("phoneNumber");

    log('Logout ----- ${prefs.getBool("login")}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: getBooks(),
          builder: (context, AsyncSnapshot<List<Book>> snapshot) {
            if (snapshot.hasError) {
              log('Error: ${snapshot.error}');
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final books = snapshot.data!;

              return GestureDetector(
                // onTap: () => {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => addServiceScreen(),
                //     ),
                //   )
                // },
                child: ListView(
                  children: books.map(bookTile).toList(),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(65, 65),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 40, 33),
                    ),
                  ),
                  onPressed: () {
                    removeValues();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size(65, 65),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 200, 47),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => addBookScreen(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/* GETS BOOKS FROM THE CURRENT LOGGED IN NUMBER*/
  Stream<List<Book>> getBooks() => FirebaseFirestore.instance
      .collection(phoneNumberController.text == ''
          ? phoneGb
          : phoneNumberController.text)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.map(
          (doc) {
            return Book.fromJson(
              doc.data(),
            );
          },
        ).toList(),
      );

  Widget bookTile(Book book) {
    return Container(
      // tileColor: Colors.red,
      // title: Text(service.nomeCliente),
      // subtitle: Text(
      //   service.dataRequisicao.toString(),
      // ),
      // onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            !book.bookRead
                ? Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 198, 198),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        // trailing: Icon(Icons.menu_book_sharp),
                        // tileColor: Colors.red.shade100,
                        title: Text(
                            '${book.bookTitle.toString()} by ${book.bookAuthor.toString()}'),
                        subtitle: Text('Started on ${book.bookTimeStarted}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetailsScreen(
                                bookTitle: book.bookTitle,
                                bookPages: book.bookPages,
                                bookRead: book.bookRead,
                                book: book,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Container(
                    // color: Color.fromARGB(255, 181, 192, 144),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 198, 255, 254),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        trailing: Icon(
                          Icons.menu_book,
                          color: Colors.black,
                        ),
                        title: Text(
                          '${book.bookTitle.toString()} by ${book.bookAuthor.toString()}',
                        ),
                        subtitle: Text('Finished on ${book.bookDateRead}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDetailsScreen(
                                bookTitle: book.bookTitle,
                                bookPages: book.bookPages,
                                bookRead: book.bookRead,
                                book: book,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

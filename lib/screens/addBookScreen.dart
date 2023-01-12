// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../methods/checkFields.dart';
import '../utils/bookGlobals.dart' as globals;

import '../methods/saveBook.dart';

class addBookScreen extends StatefulWidget {
  const addBookScreen({Key? key}) : super(key: key);

  @override
  State<addBookScreen> createState() => _addBookScreenState();
}

class _addBookScreenState extends State<addBookScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Novo Serviço'),
        // ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Colors.black),
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            labelText: 'Title',
                          ),
                          onChanged: (value) {
                            setState(
                              () {
                                globals.bookTitle.text = value;
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Colors.black),
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            labelText: 'Author',
                          ),
                          onChanged: (value) {
                            setState(
                              () {
                                globals.bookAuthor.text = value;
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Colors.black),
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            labelText: 'Description',
                          ),
                          onChanged: (value) {
                            setState(
                              () {
                                globals.bookDescription.text = value;
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Colors.black),
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            labelText: 'Genre',
                          ),
                          onChanged: (value) {
                            setState(
                              () {
                                globals.bookGenre.text = value;
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Colors.black),
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            labelText: 'N pages',
                          ),
                          onChanged: (value) {
                            setState(
                              () {
                                globals.bookPages.text = value;
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            counterStyle: TextStyle(color: Colors.black),
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            labelText: 'Rating',
                          ),
                          onChanged: (value) {
                            setState(
                              () {
                                globals.bookRating.text = value;
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DateTimeField(
                          decoration: const InputDecoration(
                            hintText: 'Time Started',
                            counterStyle: TextStyle(color: Colors.black),
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          selectedDate: globals.dataReqSelectts,
                          onDateSelected: (DateTime value) {
                            setState(
                              () {
                                globals.bookTimeStarted = value.toString();
                                globals.dataReqSelectts = value;
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DateTimeField(
                          decoration: const InputDecoration(
                            hintText: 'Time Finished',
                            counterStyle: TextStyle(color: Colors.black),
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                          ),
                          selectedDate: globals.dataReqSelect,
                          onDateSelected: (DateTime value) {
                            setState(
                              () {
                                globals.bookDateRead = value.toString();
                                globals.dataReqSelect = value;
                              },
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Book Read'),
                          Switch(
                            value: globals.bookRead,
                            onChanged: (value) {
                              setState(
                                () {
                                  globals.bookRead = value;
                                  log('${globals.bookRead}');
                                },
                              );
                            },
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        persistentFooterButtons: [
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
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          CheckFields.checkFields()
              ? ElevatedButton(
                  onPressed: () {
                    try {
                      SaveBook.saveBook(
                        globals.bookTitle.text,
                        globals.bookAuthor.text,
                        globals.bookGenre.text,
                        globals.bookRating.text,
                        globals.bookPages.text,
                        globals.bookRead,
                        globals.bookDateRead.toString(),
                        globals.bookDescription.text,
                        globals.bookTimeToRead.toString(),
                        globals.bookTimeStarted.toString(),
                      );
                    } on Exception catch (e) {
                      log('ERROR SAVING ----- ${e.toString()}');
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Serviço criado com sucesso'),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.check),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: Colors.green,
                    padding: EdgeInsets.all(10),
                  ),
                )
              : ElevatedButton(
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Preencha todos os campos'),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.check,
                    color: Colors.black,
                  ),
                ),
        ],
        extendBody: true,
      ),
    );
  }
}

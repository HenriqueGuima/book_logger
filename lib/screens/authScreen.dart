// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, constant_identifier_names

import 'dart:developer';
import 'dart:ffi';

import 'package:book_logger/main.dart';
import 'package:book_logger/screens/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/globals.dart' as globals;
import '../utils/preferences_service.dart';

enum MobileVerificationState {
  SHOW_FORM_STATE,
  SHOW_OTP_STATE,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_FORM_STATE;
  final _otpController = TextEditingController();
  late String verificationId = "";
  bool showLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final _preferencesService = PreferencesService();
  late SharedPreferences logindata;

  @override
  void initState() {
    super.initState();
    _prefs.then(
      (SharedPreferences prefs) {
        return prefs.getBool('login') ?? true;
      },
    );

    _prefs.then(
      (SharedPreferences prefs) {
        return prefs.getString('phoneNumber');
      },
    );
    initial();
  }

  @override
  void dispose() {
    globals.phoneNumberController.dispose();
    super.dispose();
  }

  getFormWidget(context) {
    globals.phoneNumber = globals.phoneNumberController.text;

    return Column(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          // child: intlPhoneFieldComponent(
          //   phone_controller: globals.phoneNumberController,
          // ),
          child: TextFormField(
            cursorColor: Colors.black,
            inputFormatters: [
              LengthLimitingTextInputFormatter(9),
            ],
            controller: globals.phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              counterStyle: TextStyle(color: Colors.black),
              floatingLabelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              labelText: 'Phone Number',
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
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
          child: Text(style: TextStyle(color: Colors.black), 'Enviar'),
          onPressed: () async {
            setState(
              () {
                currentState = MobileVerificationState.SHOW_OTP_STATE;
                this.verificationId = verificationId;
                showLoading = true;
              },
            );
            _verifyNumber();
          },
        ),
        Spacer(),
      ],
    );
  }

  getOTPWidget(context) {
    return Column(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: PinCodeTextField(
            keyboardType: TextInputType.number,
            appContext: context,
            length: 6,
            onChanged: (value) {
              setState(
                () {
                  _otpController.text = value;
                },
              );
            },
            pinTheme: PinTheme(
              activeFillColor: Colors.black,
              inactiveFillColor: Colors.grey,
              activeColor: Colors.black,
              inactiveColor: Colors.black,
              selectedColor: Colors.black,
              selectedFillColor: Colors.black,
              errorBorderColor: Colors.red,
            ),
          ),
        ),
        // TextField(
        //   controller: _otpController,
        //   decoration: InputDecxfforation(
        //     labelText: 'Número de telefone',
        //     hintText: '+351912345678',
        //   ),
        // ),
        ElevatedButton(
          style: ButtonStyle(
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
              Color.fromARGB(255, 236, 184, 41),
            ),
          ),
          child: Text(style: TextStyle(color: Colors.black), 'Login'),
          onPressed: () async {
            logindata.setBool('login', true);
            logindata.setString(
              'phoneNumber',
              globals.phoneNumberController.text,
            );

            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: _otpController.text,
            );
            signInWithPhoneCredential(phoneAuthCredential);

            log(
              logindata.toString(),
            );

            log('verified ------ ${phoneAuthCredential.token} ${_otpController.text}');
          },
        ),

        ElevatedButton(
          style: ButtonStyle(
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
              Color.fromARGB(255, 0, 220, 216),
            ),
          ),
          onPressed: () async {
            _verifyNumber();
          },
          child: Text(style: TextStyle(color: Colors.black), 'Resend Pin'),
        ),
        Spacer(),
      ],
    );
  }

  _verifyNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 120),
      phoneNumber: '+351${globals.phoneNumberController.text}', //ALWAYS PT
      // timeout: const Duration(seconds: 20),
      //COMPLETED
      verificationCompleted: (phoneAuthCredential) async {
        setState(
          () {
            showLoading = false;
          },
        );
        // SnackBar(
        //   content: Text('Verification Completed'),
        // );

        //MANDAR PARA OUTRA PÁGINA
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Verificação Concluída'),
          ),
        );

        _preferencesService.saveBool();
        _preferencesService.saveString();
      },
      //FAILED
      verificationFailed: (FirebaseAuthException e) {
        bool _tooManyRequests = false;

        if (e.toString().contains('too-many-requests')) {
          _tooManyRequests = true;
          log(
            'FAILED BECAUSE TOO MANY REQUESTS ------ ${globals.phoneNumberController} ${_otpController.text} ${verificationId}',
          );
        }

        setState(
          () {
            showLoading = false;
          },
        );
        // SnackBar(
        //   content: Text(e.toString()),
        // );

        //CHECK IF THERE WERE MADE TOO MANY REQUESTS

        !_tooManyRequests
            ? ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Verificação Falhada'),
                ),
              )
            : ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Demasiadas tentativas, tente mais tarde'),
                ),
              );
        // log(e.toString());
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ),
        );
      },
      //CODE SENT
      codeSent: (verificationId, resendingToken) async {
        setState(
          () {
            showLoading = false;
            currentState = MobileVerificationState.SHOW_OTP_STATE;
            this.verificationId = verificationId;
            log('Code Sent to: ${globals.phoneNumberController.text} with $verificationId');
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Código Enviado!'),
          ),
        );
      },
      //TIMEOUT
      codeAutoRetrievalTimeout: (verificationId) {
        // SnackBar(
        //   content: Text('Code Auto Retrieval Timeout'),
        // );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Timeout'),
          ),
        );
      },
    );
    getStringValue();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  signInWithPhoneCredential(PhoneAuthCredential phoneAuthCredential) async {
    final SharedPreferences prefs = await _prefs;

    setState(
      () {
        showLoading = true;
      },
    );

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(
        () {
          showLoading = false;
        },
      );
      if (authCredential.user != null) {
        // setState(() {
        //   globals.logged = prefs.setBool('login', true);
        // });
        // _preferencesService.saveBool();

        logindata.setBool('login', true);
        logindata.setString('phoneNumber', globals.phoneNumberController.text);
        log('saving phone number as ${globals.phoneNumberController.text}');

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Completo'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(
        () {
          showLoading = false;
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color.fromARGB(255, 255, 40, 33),
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 236, 184, 41),
                  ),
                )
              : currentState == MobileVerificationState.SHOW_FORM_STATE
                  ? getFormWidget(context)
                  : getOTPWidget(context),
        ),
      ),
    );
  }

  // addBoolToSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('login', true);
  //   prefs.setString(
  //     'phoneNumber',
  //     globals.phoneNumberController.text,
  //   );
  // }

  getBoolValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool? boolValue = prefs.getBool('login');
    return boolValue;
  }

  getStringValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('phoneNumber');
    log('Getting phone number ${stringValue.toString()}');
    return stringValue;
  }
}

import 'package:flutter/material.dart';
import 'package:cryptovote_voter_app/screens/screens.dart';

class MnemonicScreen extends StatefulWidget {
  MnemonicScreen({Key? key}) : super(key: key);

  @override
  _MnemonicScreenState createState() => _MnemonicScreenState();
}

class _MnemonicScreenState extends State<MnemonicScreen> {
  bool loading = false;

  String mnemonicPhrase =
      "balloon marmalade rotate umbrella elephant bounce winner never ice helicopter crazy obscure";

  void onContinue() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      loading = false;
    });

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1A98F8),
                Color(0xFFCAE4F7),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Color(0xFF1165A6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Secret Generation",
                    style: TextStyle(
                      color: Color(0xFF393939),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Now you have almost completed the registration process. On this screen you will be displayed a set of mnemonic words which can be used to recover your voting application if you have unexpectedly removed voting application or reset your phone.",
                    style: TextStyle(
                      color: Color(0xFF1165A6),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Plaese keep this secret phrase in a secure place.",
                    style: TextStyle(
                      color: Color(0xFFCE1E1E),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFA4D4F9),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Text(
                        mnemonicPhrase,
                        style: TextStyle(
                          color: Color(0xFF404040),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 50,
                    child: RaisedButton(
                      child: loading
                          ? Container(
                              width: 35,
                              height: 35,
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white)),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color(0xFF1785DF),
                      textColor: Colors.white,
                      onPressed: onContinue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

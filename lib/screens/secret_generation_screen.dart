import 'package:cryptovote_voter_app/utils/cryptography_utils.dart';
import 'package:flutter/material.dart';
import 'package:cryptovote_voter_app/screens/screens.dart';

class SecretGenerationScreen extends StatefulWidget {
  SecretGenerationScreen({Key? key}) : super(key: key);

  @override
  _SecretGenerationScreenState createState() => _SecretGenerationScreenState();
}

class _SecretGenerationScreenState extends State<SecretGenerationScreen> {
  bool loading = false;

  String mnemonicPhrase =
      "balloon marmalade rotate umbrella elephant bounce winner never ice helicopter crazy obscure";

  void onContinue() async {
    setState(() {
      loading = true;
    });

    CryptographyUtils cryptographyUtils = CryptographyUtils();

    cryptographyUtils.generateRSAKeyPair();

    // await Future.delayed(Duration(seconds: 2));

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
                Color(0xFF4BAEF9),
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
                  SizedBox(
                    height: 30,
                  ),
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
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Now you have almost completed the registration process. On this screen you will be generating a secret key which will be kept inside this application. For the upcomming voting processes the app will be using this secret key to identify yourself. Therefore do not delete or loose this application. If you loose the application or the mobile device please contact the voting authority.",
                    style: TextStyle(
                      color: Color(0xFF1165A6),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "By pressing continue button you will be navigated to the voting application home.",
                    style: TextStyle(
                      color: Color(0xFF1165A6),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // Text(
                  //   "Plaese keep this secret phrase in a secure place.",
                  //   style: TextStyle(
                  //     color: Color(0xFFA31F1F),
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Color(0xFFA4D4F9),
                  //     border: Border.all(
                  //       color: Colors.black,
                  //       width: 1,
                  //     ),
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       vertical: 20,
                  //       horizontal: 20,
                  //     ),
                  //     child: Text(
                  //       mnemonicPhrase,
                  //       style: TextStyle(
                  //         color: Color(0xFF404040),
                  //         fontSize: 25,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // ),
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
                                  color: Colors.white,
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

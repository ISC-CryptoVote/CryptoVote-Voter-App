import 'package:flutter/material.dart';

class RegistrationRejectedScreen extends StatefulWidget {
  RegistrationRejectedScreen({Key? key}) : super(key: key);

  @override
  _RegistrationRejectedScreenState createState() =>
      _RegistrationRejectedScreenState();
}

class _RegistrationRejectedScreenState
    extends State<RegistrationRejectedScreen> {
  bool loading = false;

  void onContinue() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      loading = false;
    });
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
                    "Registration Failed",
                    style: TextStyle(
                      color: Color(0xFF8C3838),
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Please ensure all required fields are filled out correctly and try again. Press continue button to proceed to the registration screen.",
                    style: TextStyle(
                      color: Color(0xFF1165A6),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
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

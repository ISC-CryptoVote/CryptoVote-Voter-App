import 'package:cryptovote_voter_app/screens/registration_approved_screen%20.dart';
import 'package:cryptovote_voter_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class RegistrationUnconfirmedScreen extends StatefulWidget {
  RegistrationUnconfirmedScreen({Key? key}) : super(key: key);

  @override
  _RegistrationUnconfirmedScreenState createState() =>
      _RegistrationUnconfirmedScreenState();
}

class _RegistrationUnconfirmedScreenState
    extends State<RegistrationUnconfirmedScreen> {
  bool loading = false;

  void onContinue() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 1));

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => RegistrationApprovedScreen(),
      ),
    );

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
                  SizedBox(
                    height: 150,
                  ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Icon(
                  //       Icons.arrow_back_ios_new_rounded,
                  //       color: Colors.white,
                  //       size: 20,
                  //     ),
                  //     style: ElevatedButton.styleFrom(
                  //       shape: CircleBorder(),
                  //       padding: EdgeInsets.all(20),
                  //       primary: Color(0xFF1165A6),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Registration Pending",
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
                    "Your registration is not yet confirmed by the voting authority. This process will take few days and you will receive a SMS regarding registration approval. If it takes more than 5 working days please contact the voting authority via hot lines.",
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
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.black,
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   height: 50,
                  //   child: RaisedButton(
                  //     child: loading
                  //         ? Container(
                  //             width: 35,
                  //             height: 35,
                  //             child: CircularProgressIndicator(
                  //                 valueColor: AlwaysStoppedAnimation<Color>(
                  //                     Colors.white)),
                  //           )
                  //         : Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(horizontal: 20),
                  //             child: Text(
                  //               "Continue",
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //           ),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30)),
                  //     color: Color(0xFF1785DF),
                  //     textColor: Colors.white,
                  //     onPressed: onContinue,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cryptovote_voter_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({Key? key}) : super(key: key);

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  bool loading = false;

  void onSubmit() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 1));

    if (true) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => VotingVerificationScreen(
            phoneNumber: "0711737706",
          ),
        ),
      );
    } else {
      Get.snackbar(
        "Voting Failed!",
        "Please select a candidate and press submit button.",
        backgroundColor: Color(0xFF943029),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }

    setState(() {
      loading = false;
    });
  }

  String? candidate;

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
                    "Vote for your candidate",
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
                    "You can select one candidate to vote. Your vote will be invalid if you select more that one candidate or if you select no candidate. So please ensure that you have selected only one candidate before submitting.",
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
                  Column(
                    children: [
                      RadioListTile(
                        title: Text(
                          "Bob",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        value: "Bob",
                        groupValue: candidate,
                        onChanged: (value) {
                          setState(() {
                            candidate = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          "Tom",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        value: "Tom",
                        groupValue: candidate,
                        onChanged: (value) {
                          setState(() {
                            candidate = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          "Alice",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        value: "Alice",
                        groupValue: candidate,
                        onChanged: (value) {
                          setState(() {
                            candidate = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                          "Charlie",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        value: "Charlie",
                        groupValue: candidate,
                        onChanged: (value) {
                          setState(() {
                            candidate = value.toString();
                          });
                        },
                      )
                    ],
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
                                "Submit",
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
                      onPressed: onSubmit,
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

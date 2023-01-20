import 'package:cryptovote_voter_app/controllers/auth_controller.dart';
import 'package:cryptovote_voter_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VotingVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  VotingVerificationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  _VotingVerificationScreenState createState() =>
      _VotingVerificationScreenState();
}

class _VotingVerificationScreenState extends State<VotingVerificationScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  bool loading = false;

  void onContinue() async {
    print(pinController.value.text);

    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 1));

    bool result = await AuthController().phoneVerify(
      widget.phoneNumber,
      pinController.value.text,
    );

    if (result) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => VotingSuccessfulScreen(),
        ),
      );
    } else {
      Get.snackbar("Otp Verification Failed!",
          "Incorrect Otp address please try again.");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    const focusedBorderColor = Color(0xFF15237B);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color(0x660E5044);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // backgroundColor: Color(0xFFDDF0FF),
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
                      "Vote Verification",
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
                      "Enter the verification code sent to the number",
                      style: TextStyle(
                        color: Color(0xFF1165A6),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.phoneNumber,
                      style: TextStyle(
                        color: Color(0xFF09395D),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Pinput(
                              controller: pinController,
                              focusNode: focusNode,
                              androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.smsUserConsentApi,
                              listenForMultipleSmsOnAndroid: true,
                              defaultPinTheme: defaultPinTheme,
                              // validator: (value) {
                              //   return value == '2222'
                              //       ? null
                              //       : 'Pin is incorrect';
                              // },
                              hapticFeedbackType:
                                  HapticFeedbackType.lightImpact,
                              onCompleted: (pin) {
                                onContinue();
                              },
                              // onChanged: (value) {
                              //   debugPrint('onChanged: $value');
                              // },
                              cursor: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 9),
                                    width: 22,
                                    height: 1,
                                    color: focusedBorderColor,
                                  ),
                                ],
                              ),
                              focusedPinTheme: defaultPinTheme.copyWith(
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: focusedBorderColor),
                                ),
                              ),
                              submittedPinTheme: defaultPinTheme.copyWith(
                                decoration:
                                    defaultPinTheme.decoration!.copyWith(
                                  color: fillColor,
                                  borderRadius: BorderRadius.circular(19),
                                  border: Border.all(color: focusedBorderColor),
                                ),
                              ),
                              errorPinTheme: defaultPinTheme.copyBorderWith(
                                border: Border.all(color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ],
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
                    SizedBox(
                      height: 40,
                    ),
                    // Text(
                    //   "Didn't receive a code?",
                    //   style: TextStyle(
                    //     color: Color(0xFF0E4F82),
                    //     fontSize: 17,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                    // GestureDetector(
                    //   onTap: onResend,
                    //   child: Text(
                    //     "Resend",
                    //     style: TextStyle(
                    //       color: Color(0xFF0E4F82),
                    //       fontSize: 17,
                    //       fontWeight: FontWeight.w400,
                    //       decoration: TextDecoration.underline,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

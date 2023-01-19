import 'package:cryptovote_voter_app/screens/screens.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gnDivisionController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController macHashController = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    super.initState();

    macHashController.text =
        "97c91b9d64940936e39f1b39d1fc944a8e4798b4355f6ca797da2ee0796e9e7497c91b9d64940936e39f1b39d1fc944a8e4798b4355f6ca797da2ee0796e9e74";
  }

  void onSubmit() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      loading = false;
    });

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => OtpScreen(phoneNumber: "0711737706"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFDDF0FF),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Register as a Voter",
                    style: TextStyle(
                      color: Color(0xFF393939),
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                      topic: "Full Name", controller: nameController),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(topic: "NIC", controller: nicController),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      topic: "Address", controller: addressController),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      topic: "GN Division", controller: gnDivisionController),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      topic: "Phone Number", controller: phoneNumberController),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextBox(
                    topic: "Mac Hash",
                    controller: macHashController,
                    enabled: false,
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

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    required this.topic,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String topic;
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: TextField(
        enabled: enabled,
        maxLines: 2,
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: topic,
          labelStyle: TextStyle(
            color: Color(0xFF0B3C61),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 20,
          ),
        ),
        controller: controller,
      ),
    );
  }
}

class CustomTextBox extends StatelessWidget {
  CustomTextBox({
    Key? key,
    required this.controller,
    required this.topic,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String topic;
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        enabled: enabled,
        // maxLines: 5,
        maxLines: 3,
        style: TextStyle(
          color: Color(0xFF000000),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: topic,
          labelStyle: TextStyle(
            color: Color(0xFF0B3C61),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 20,
          ),
        ),
        controller: controller,
      ),
    );
  }
}

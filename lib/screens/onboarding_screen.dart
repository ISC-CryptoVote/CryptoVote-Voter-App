import 'package:cryptovote_voter_app/controllers/auth_controller.dart';
import 'package:cryptovote_voter_app/screens/screens.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool loading = false;
  @override
  void initState() {
    super.initState();

    checkRegistration();
  }

  void checkRegistration() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(Duration(seconds: 1));

    String status = AuthController().getVoterStatus();

    if (status == "Unconfirmed") {
      // Navigate to Registration screen
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const RegistrationScreen(),
        ),
      );
    } else if (status == "Pending") {
      // Navigate to Registration unconfirmed screen
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => RegistrationUnconfirmedScreen(),
        ),
      );
    } else if (status == "Approved") {
      // Navigate to Registration Approved screen
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => RegistrationApprovedScreen(),
        ),
      );
    } else if (status == "Rejected") {
      // Navigate to Registration Rejected screen
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => RegistrationRejectedScreen(),
        ),
      );
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const RegistrationScreen(),
          ),
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/Voting home.png",
                    ),
                  ),
                ),
              ),
              Container(
                width: 35,
                height: 35,
                child: loading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF1785DF),
                        ),
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

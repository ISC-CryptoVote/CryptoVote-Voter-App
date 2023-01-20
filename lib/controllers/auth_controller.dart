import 'package:cryptovote_voter_app/apis/auth_api.dart';

class AuthController {
  dynamic getVoterStatus() {
    // var result = AuthApi().registration(
    //     name: name,
    //     nic: nic,
    //     address: address,
    //     gn_division: gn_division,
    //     phone_number: phone_number,
    //     mac_hash: mac_hash);

    // returns user registration status as a string

    return "Unconfirmed";
  }

  dynamic registerVoter(String name, String nic, String address,
      String gn_division, String phone_number, String mac_hash) {
    // var result = AuthApi().registration(
    //     name: name,
    //     nic: nic,
    //     address: address,
    //     gn_division: gn_division,
    //     phone_number: phone_number,
    //     mac_hash: mac_hash);

    return true;
  }

  dynamic phoneVerify(String phone_number, String otp) {
    // var result = AuthApi().phoneVerify(
    //   phone: phone_number,
    //   otp: otp,
    // );

    return true;
  }
}

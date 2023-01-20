import 'package:cryptovote_voter_app/utils/api_utils.dart';

class AuthApi {
  late final ApiUtils apiUtils;

  void initState() {
    this.apiUtils = ApiUtils();
  }

  Future<dynamic> getVoterStatus() async {
    String url = '/api/auth/voter/status';
    dynamic response = await apiUtils.postRequest(
      url: url,
      data: {},
      token: '',
    );
    return response;
  }

  Future<dynamic> registration(
      {required String name,
      required String nic,
      required String address,
      required String gn_division,
      required String phone_number,
      required String mac_hash}) async {
    String url = '/api/auth/voter/registration';
    dynamic response = await apiUtils.postRequest(
      url: url,
      data: {
        "name": name,
        "nic": nic,
        "address": address,
        "gn_division": gn_division,
        "phone_number": phone_number,
        "mac_hash": mac_hash,
      },
      token: '',
    );
    return response;
  }

  Future<dynamic> phoneAuth({required String phone}) async {
    String url = '/api/auth/voter/phoneAuth';
    dynamic response = await apiUtils.postRequest(
      url: url,
      data: {
        "phone": phone,
      },
      token: '',
    );
    return response;
  }

  Future<dynamic> phoneVerify(
      {required String phone, required String otp}) async {
    String url = '/api/auth/voter/verify';
    dynamic response = await apiUtils.postRequest(
      url: url,
      data: {
        "phone": phone,
        "otp": otp,
      },
      token: '',
    );
    return response;
  }
}

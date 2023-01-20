import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cryptovote_voter_app/apis/config.dart';

class ApiUtils {
  final http.Client _client;
  ApiUtils() : _client = http.Client();

  Future<Map<dynamic, dynamic>> getRequest(
      {required String url, required String token}) async {
    try {
      var completeUrl = Uri.http(BASEURL, url);
      var response;
      if (token == "") {
        response = await _client
            .get(completeUrl, headers: {"Content-Type": "application/json"});
      } else {
        response = await _client.get(
          completeUrl,
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          },
        );
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return generateSuccessOutput(response);
      } else {
        return generateErrorOutput(jsonDecode(response.body));
      }
    } catch (error) {
      Get.snackbar("Something is wrong" + "!!!", "Please try again");
      debugPrint("try catch Error : " + error.toString());
      return {"error": true};
    }
  }

  Future<Map<dynamic, dynamic>> postRequest(
      {required String url,
      required Map<String, dynamic> data,
      required String token}) async {
    try {
      var completeUrl = Uri.http(BASEURL, url);
      var jsonEncodedData = jsonEncode(data);

      debugPrint(jsonEncodedData.toString());
      var response;
      if (token == "") {
        response = await _client.post(completeUrl,
            headers: {"Content-Type": "application/json"},
            body: jsonEncodedData);
      } else {
        response = await _client.post(completeUrl,
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $token',
            },
            body: jsonEncodedData);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("a");
        return generateSuccessOutput(response);
      } else {
        debugPrint("b");
        return generateErrorOutput(jsonDecode(response.body));
      }
    } catch (error) {
      Get.snackbar("Something is wrong" + "!!!", "Please try again");
      debugPrint("try catch Error : " + error.toString());
      return {"error": true};
    }
  }

  Future<Map<dynamic, dynamic>> putRequest(
      {required String url,
      required Map<String, dynamic> data,
      required String token}) async {
    try {
      var completeUrl = Uri.http(BASEURL, url);
      var jsonEncodedData = jsonEncode(data);
      var response;
      if (token == "") {
        response = await _client.put(completeUrl,
            headers: {"Content-Type": "application/json"},
            body: jsonEncodedData);
      } else {
        response = await _client.put(completeUrl,
            headers: {
              "Content-Type": "application/json",
              'Authorization': 'Bearer $token',
            },
            body: jsonEncodedData);
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return generateSuccessOutput(response);
      } else {
        return generateErrorOutput(jsonDecode(response.body));
      }
    } catch (error) {
      Get.snackbar("Something is wrong" + "!!!", "Please try again");
      debugPrint("try catch Error : " + error.toString());
      return {"error": true};
    }
  }

  Map<dynamic, dynamic> generateSuccessOutput(response) {
    debugPrint("generateSuccessOutput : " + response.body);
    return {
      "code": response.statusCode,
      "body": jsonDecode(response.body),
      "error": false,
    };
  }

  Map<dynamic, dynamic> generateErrorOutput(error) {
    if (error["message"] != null) {
      Get.snackbar(error["message"] + "!!!", "Please try again");
      debugPrint("generateErrorOutput : " + error.toString());
      return {"error": true};
    } else {
      Get.snackbar("Something is wrong" + "!!!", "Please try again");
      debugPrint("generateErrorOutput Else : " + error.toString());
      return {"error": true};
    }
  }
}

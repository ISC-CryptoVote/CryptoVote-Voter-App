import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:crypton/crypton.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CryptographyUtils {
  String convertStringToHash(String value) {
    var bytes = utf8.encode(value);
    var digest = sha512.convert(bytes);
    return digest.toString();
  }

  dynamic generateRSAKeyPair() async {
    // Generate a RSA keypair
    RSAKeypair rsaKeypair = RSAKeypair.fromRandom(keySize: 1024);

    // Create storage
    final storage = FlutterSecureStorage();

    // save key pair in a secure storage
    await storage.write(
      key: "Voter Secret Key",
      value: rsaKeypair.privateKey.toPEM(),
      aOptions: const AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );

    await storage.write(
      key: "Voter Private Key",
      value: rsaKeypair.publicKey.toPEM(),
      aOptions: const AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );

    String nonce = "d4CUR3Ln";

    getSignature(rsaKeypair, nonce);

    return rsaKeypair;
  }

  void readPrivateKey() async {
    // Create storage
    final storage = new FlutterSecureStorage();

    String? value = await storage.read(
      key: "Voter Secret Key",
    );

    print("Read\n${value}");
  }

  String getSignature(RSAKeypair rsaKeypair, String message) {
    var signature = base64Encode(rsaKeypair.privateKey
        .createSHA256Signature(utf8.encode(message) as Uint8List));

    return signature.toString();
  }
  
}

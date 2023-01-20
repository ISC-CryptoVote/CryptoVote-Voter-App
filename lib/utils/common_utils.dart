import 'package:mac_address/mac_address.dart';

class CommonUtils {
  Future<String> getMacOfDevice() async {
    return await GetMac.macAddress;
  }
}

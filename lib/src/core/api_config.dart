import 'dart:developer';

enum Environment { production, development, localhost }

class ApiConfig {
  static late Environment env;

  static void initApiEnvironment() {

    //flavor passed from launch.json or cli --dart-define
    const flavor = String.fromEnvironment("API_FLAVOR");
    log("flavor :: $flavor");
    if (flavor == Environment.production.name) {
      env = Environment.production;
    } else if (flavor == Environment.development.name) {
      env = Environment.development;
    } else {
      env = Environment.localhost;
    }
  }

  static const String localhost = "http://192.168.1.14:8080";
  static const String devServerUrl = 'https://test.apiv2.enirman.com';
  static String prodServerUrl = 'https://api.enirman.com';

  static const String apiUrl = "/api";
  static const String apiVersion2Url = "/v2";
  static const String vendorUrl = "/vendor";

  static String baseUrl = (env == Environment.production
          ? prodServerUrl
          : env == Environment.development
              ? devServerUrl
              : localhost) +
      apiUrl +
      apiVersion2Url;
}

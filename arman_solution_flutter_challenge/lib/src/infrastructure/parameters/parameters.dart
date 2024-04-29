

class Parameters {
  static String? accessToken;
  static bool canCheckBiometric = false;
  static bool biometricLogin = false;
  static String? userFulName;
  static String? userEmail;
  static String? userAvatar;

  static Map<String, String> getHeader() {
    if (accessToken?.isNotEmpty ?? false) {
      return {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      };
    }

    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }
}

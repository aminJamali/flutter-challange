import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../infrastructure/router/route_names.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey();

  bool isPasswordVisible = false;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final SharedPreferences preferences;

  Future<void> login(final BuildContext context) async {
    if (userNameController.text == 'arman' &&
        passwordController.text == 'arman') {
      await Navigator.pushReplacementNamed(context, RouteNames.map);
    }
    // isWaiting = true;
    // notifyListeners();
    // final result = await loginUseCase.call(getLoginDto());
    // isWaiting = false;
    //
    // notifyListeners();
    // result.fold(
    //   (final l) =>
    //       ErrorHandlerController().showErrorHandel(error: l, context: context),
    //   (final r) async {
    //     preferences = await SharedPreferences.getInstance();
    //     Parameters.accessToken = r.token;
    //     Parameters.userFulName = r.user.name;
    //     Parameters.userEmail = r.user.email;
    //     Parameters.userAvatar = r.user.avatar;
    //     await preferences.setString(LocalStorageKey.nameKey, r.user.name);
    //     await preferences.setString(LocalStorageKey.emailKey, r.user.email);
    //     if (r.user.avatar != null) {
    //       await preferences.setString(
    //           LocalStorageKey.avatarKey, r.user.avatar!);
    //     }
    //
    //     if (biometricLogin) {
    //       await preferences.setString(LocalStorageKey.apiToken, r.token);
    //       await Navigator.pushReplacementNamed(
    //           context, RouteNames.loginBiometric);
    //     } else {
    //       await Navigator.pushReplacementNamed(context, RouteNames.home);
    //     }
    //   },
    // );
  }

  void onPasswordVisible() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../infrastructure/utils/utils.dart';
import '../provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginProvider loginProvider;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((final _) {
    loginProvider = context.read<LoginProvider>();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height - 70,
              ),
              child: Form(
                key: loginProvider.formKey,
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Utils.largeVerticalSpacer,
                            Utils.largeVerticalSpacer,
                            Utils.largeVerticalSpacer,
                            Utils.largeVerticalSpacer,
                            Utils.mediumVerticalSpacer,
                            Center(
                              child: Text(
                                'Login To The App',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).cardColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    _body(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _body() => Padding(
        padding: const EdgeInsets.only(
          top: 180,
          left: 8,
          right: 8,
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Utils.mediumVerticalSpacer,
                TextFormField(
                  decoration: const InputDecoration(label: Text('User Name')),
                  controller: loginProvider.userNameController,
                  validator: (final value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                Utils.mediumVerticalSpacer,
                Utils.mediumVerticalSpacer,
                Consumer<LoginProvider>(
                  builder: (final _, final provider, final __) => TextFormField(
                    validator: (final value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    obscureText: !provider.isPasswordVisible,
                    controller: loginProvider.passwordController,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                        onPressed: loginProvider.onPasswordVisible,
                        icon: Icon(
                          provider.isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                Utils.largeVerticalSpacer,
                const Spacer(),
                Consumer<LoginProvider>(
                  builder: (final _, final provider, final __) => FilledButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (loginProvider.formKey.currentState!.validate()) {
                        loginProvider.login(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

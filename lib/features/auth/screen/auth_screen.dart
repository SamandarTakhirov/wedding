import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../router/app_route.dart';
import 'widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController loginController;
  late final TextEditingController passwordController;

  final ValueNotifier<String?> loginError = ValueNotifier(null);
  final ValueNotifier<String?> passwordError = ValueNotifier(null);

  @override
  void initState() {
    loginController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validatePassword() {
    if (loginController.text == 'Admin1' && passwordController.text == 'admin1') {
      loginError.value = null;
      passwordError.value = null;
      context.pushReplacementNamed(Routes.dashboard);
    } else {
      if (loginController.text != 'Admin1') {
        loginError.value = 'Invalid Login';
      } else {
        loginError.value = null;
      }

      if (passwordController.text != 'admin1') {
        passwordError.value = 'Invalid Password';
      } else {
        passwordError.value = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) => ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 500,
                minWidth: 300,
              ),
              child: SizedBox(
                width: context.width,
                height: context.height * 0.35,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 100,
                        offset: Offset(40, 20),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      spacing: 15,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ValueListenableBuilder<String?>(
                          valueListenable: loginError,
                          builder: (context, error, child) => CustomTextField(
                            controller: loginController,
                            hintText: 'Login',
                            errorText: error,
                          ),
                        ),
                        ValueListenableBuilder<String?>(
                          valueListenable: passwordError,
                          builder: (context, error, child) => CustomTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            isPassword: true,
                            errorText: error,
                          ),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.blue,
                            fixedSize: Size(context.width, 45),
                          ),
                          onPressed: validatePassword,
                          child: const Text('Kirish'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

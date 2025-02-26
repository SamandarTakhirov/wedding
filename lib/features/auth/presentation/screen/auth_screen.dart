import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_colors.dart';
import '../../../../core/extension/extension.dart';
import '../../../../router/app_route.dart';
import '../../data/repository/auth_repository.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final TextEditingController loginController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(authRepository: AuthServiceImpl()),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.pushReplacementNamed(Routes.dashboard);
            }
          },
          builder: (context, state) => Scaffold(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextField(
                              controller: loginController,
                              hintText: 'Login',
                              errorText: state.loginErrorText,
                            ),
                            CustomTextField(
                              controller: passwordController,
                              hintText: 'Password',
                              isPassword: true,
                              errorText: state.passwordErrorText,
                            ),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.blue,
                                fixedSize: Size(context.width, 45),
                              ),
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      LoginSubmittedEvent(
                                        login: loginController.text.trim(),
                                        password: passwordController.text.trim(),
                                        context: context,
                                      ),
                                    );
                              },
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
          ),
        ),
      );
}

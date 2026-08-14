import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/AppTheme.dart';
import 'package:flutter_woc/ui/components/TextFieldComp.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../navigation/Routes.dart';
import '../../ui/components/BackButtonComp.dart';
import '../states/LoginState.dart';
import '../viewmodels/LoginViewModel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    required this.onLoginClick
  });

  final VoidCallback onLoginClick;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: _LoginContent(onLoginClick: onLoginClick),
    );
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent({required this.onLoginClick});

  final VoidCallback onLoginClick;


  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewModel>();
    final state = loginViewModel.state;

    if (state.isLoggedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onLoginClick();
      });
    }

    return Scaffold(
        body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              BackButtonComp(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 40,
                          children: [
                            Text(
                                'ACCEDI',
                                style: TextStyle(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .onPrimary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center),
                            if (state.errorMessage != null) ...[
                              Text(
                                state.errorMessage ?? state.errorMessage!,
                                style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .error,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                            TextFieldComp(
                              label: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              errorText: state.errorMessage != null ? '' : null,
                              onChanged: loginViewModel.onEmailChanged,
                            ),
                            TextFieldComp(
                              label: 'Password',
                              isPassword: true,
                              errorText: state.errorMessage != null ? '' : null,
                              onChanged: loginViewModel.onPasswordChanged,
                            ),
                            OutlinedButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () =>
                                  loginViewModel.login(),
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                      color: AppTheme.lightGreen, width: 2),
                                  minimumSize: const Size(200, 40)
                              ).copyWith(
                                backgroundColor: WidgetStateProperty
                                    .resolveWith<Color?>((states) {
                                  if (states.contains(WidgetState.pressed)) {
                                    return AppTheme.lightGreen;
                                  }
                                  return Colors.transparent;
                                }),
                              ),
                              child: Text(
                                'LOGIN',
                                style: TextStyle(color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onPrimary, fontSize: 20),),
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (state.isLoading)
                      const ModalBarrier(dismissible: false),
                    if (state.isLoading)
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            )
        )
    );
  }
}

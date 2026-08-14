import 'package:flutter/material.dart';
import 'package:flutter_woc/navigation/Routes.dart';
import 'package:flutter_woc/ui/AppTheme.dart';
import 'package:flutter_woc/users/data/model/UserModel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../auth/viewmodels/AuthViewModel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onRegisterClick,
    required this.onLoginClick,
    required this.onNextWorkoutClick,
  });

  final VoidCallback onRegisterClick;
  final VoidCallback onLoginClick;
  final VoidCallback onNextWorkoutClick;

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.watch<AuthViewModel>();

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        'BENVENUTO\n${authViewModel.isLoggedIn ? authViewModel.currentUser?.name : 'IN\nWORKOUT COACHING'}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    authViewModel.isLoggedIn
                        ? (authViewModel.currentUser?.role == UserRole.cliente
                        ? _ClienteLoggedInContent(onNextWorkoutClick: onNextWorkoutClick)
                        : const SizedBox.shrink())
                        : _LoggedOutContent(
                      onRegisterClick: onRegisterClick,
                      onLoginClick: onLoginClick,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ClienteLoggedInContent extends StatelessWidget {
  const _ClienteLoggedInContent({required this.onNextWorkoutClick});

  final VoidCallback onNextWorkoutClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 250,
      child: ElevatedButton(
        onPressed: onNextWorkoutClick,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          backgroundColor: AppTheme.lightGreen,
          foregroundColor: Colors.black,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.white,
        ),
        child: Row(
          children: [
            const Expanded(
              child: Text(
                'Accedi al prossimo allenamento',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class _LoggedOutContent extends StatelessWidget {
  const _LoggedOutContent({
    required this.onRegisterClick,
    required this.onLoginClick
  });

  final VoidCallback onRegisterClick;
  final VoidCallback onLoginClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 15,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 60),
                backgroundColor: AppTheme.lightGreen,
                elevation: 10
              ),
              onPressed: () => onLoginClick(),
              child: const Text(
                'ACCEDI',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xff000000)),
              ),
          ),

          TextButton(
              onPressed: () => onRegisterClick(),
              child: Text(
                'O registrati gratuitamente',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onPrimary,
                  decoration: TextDecoration.underline,
                ),
              ),
          ),
        ],
      ),
    );
  }
}

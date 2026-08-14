import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/TextFieldComp.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../navigation/Routes.dart';
import '../../ui/AppTheme.dart';
import '../../ui/components/BackButtonComp.dart';
import '../../users/data/model/UserModel.dart';
import '../viewmodels/RegisterViewModel.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    super.key,
    required this.onRegisterClick
  });

  final VoidCallback onRegisterClick;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: _RegisterContent(onRegisterClick: onRegisterClick,),
    );
  }
}

class _RegisterContent extends StatelessWidget {
  const _RegisterContent({required this.onRegisterClick});

  final VoidCallback onRegisterClick;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<RegisterViewModel>();
    final state = vm.state;

    if (state.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onRegisterClick();
      });
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Center(
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 25,
                    children: [
                      Text(
                        'INSERISCI I DATI:',
                        style: TextStyle(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      if (state.generalError != null)
                        Text(
                          state.generalError!,
                          style: TextStyle(color: Theme
                              .of(context)
                              .colorScheme
                              .error),
                          textAlign: TextAlign.center,
                        ),

                      TextFieldComp(
                        label: 'Nome e cognome',
                        onChanged: vm.onNameChanged,
                        errorText: state.nameError,
                      ),

                      TextFieldComp(
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: vm.onEmailChanged,
                        errorText: state.emailError,
                      ),

                      _RoleDropdown<UserRole>(
                        label: 'Ruolo',
                        items: UserRole.values,
                        itemLabel: (role) => role.toRoleString,
                        value: state.role,
                        onChanged: vm.onRoleChanged,
                        errorText: state.roleError,
                      ),

                      TextFieldComp(
                        label: 'Password',
                        isPassword: true,
                        onChanged: vm.onPasswordChanged,
                        errorText: state.passwordError,
                      ),

                      TextFieldComp(
                        label: 'Conferma password',
                        isPassword: true,
                        onChanged: vm.onConfirmPasswordChanged,
                        errorText: state.confirmPasswordError,
                      ),

                      OutlinedButton(
                        onPressed: state.isLoading ? null : vm.register,
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
                          'REGISTRATI',
                          style:
                          TextStyle(color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary, fontSize: 20),),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: BackButtonComp(),
              ),
            ),

            if (state.isLoading) const ModalBarrier(dismissible: false),
            if (state.isLoading) const Center(
                child: CircularProgressIndicator()
            ),
          ],
        ),
      ),
    );
  }
}


class _RoleDropdown<T> extends StatelessWidget {
  const _RoleDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.itemLabel,
    this.value,
    this.onChanged,
    this.errorText,
  });

  final String label;
  final List<T> items;
  final String Function(T) itemLabel;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return DropdownMenu<T>(
              initialSelection: value,
              label: Text(
                  label, 
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)
              ),
              width: constraints.maxWidth,
              onSelected: onChanged,
              textStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              menuStyle: MenuStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.white),
                surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
                minimumSize: WidgetStatePropertyAll(
                  Size(constraints.maxWidth, 0),
                ),
                maximumSize: WidgetStatePropertyAll(
                  Size(constraints.maxWidth, double.infinity),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                errorStyle: const TextStyle(height: 0),
              ),
              errorText: errorText,

              dropdownMenuEntries: items
                  .map((item) =>
                  DropdownMenuEntry<T>(
                    value: item,
                    label: itemLabel(item),
                    style: ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(
                          Color(0xff000000)),
                    ),
                  )
              ).toList(),

            );
          },
        ),
      ],
    );
  }
}
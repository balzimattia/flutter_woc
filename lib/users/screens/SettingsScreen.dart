import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/AppTheme.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:flutter_woc/ui/components/TextFieldComp.dart';
import 'package:provider/provider.dart';
import '../../auth/viewmodels/AuthViewModel.dart';
import '../../notifications/NotificationType.dart';
import '../data/model/UserModel.dart';
import '../states/ChangePasswordState.dart';
import '../viewmodels/SettingsViewModel.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.watch<AuthViewModel>().currentUser;

    return ChangeNotifierProvider(
      create: (_) => SettingsViewModel(),
      child: Consumer<SettingsViewModel>(
          builder: (context, vm, _) {
            return _SettingsContent(
              role: currentUser?.role,
              isDarkTheme: vm.isDarkTheme,
              preferences: vm.notificationPreferences,
              changePasswordState: vm.changePasswordState,
              onNotificationToggle: vm.setNotificationEnabled,
              onNewPasswordChange: vm.onNewPasswordChange,
              onConfirmPasswordChange: vm.onConfirmPasswordChange,
              onChangePasswordClick: vm.onChangePasswordClick,
              onDarkThemeSwitch: vm.setDarkTheme,
            );
          }
      )
    );
  }
}

class _SettingsContent extends StatelessWidget {
  final UserRole? role;
  final bool isDarkTheme;
  final Map<NotificationType, bool> preferences;
  final ChangePasswordState changePasswordState;
  final void Function(NotificationType, bool) onNotificationToggle;
  final void Function(String) onNewPasswordChange;
  final void Function(String) onConfirmPasswordChange;
  final VoidCallback onChangePasswordClick;
  final void Function(bool) onDarkThemeSwitch;

  const _SettingsContent({
    super.key,
    required this.role,
    required this.isDarkTheme,
    required this.preferences,
    required this.changePasswordState,
    required this.onNotificationToggle,
    required this.onNewPasswordChange,
    required this.onConfirmPasswordChange,
    required this.onChangePasswordClick,
    required this.onDarkThemeSwitch,
  });

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      _SwitchRow(
        label: 'Tema ${isDarkTheme ? "scuro" : "chiaro"}',
        checked: isDarkTheme,
        onCheckedChange: onDarkThemeSwitch,
      ),

      Text(
        'Notifiche',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onPrimary
        ),
      ),

      if (role == UserRole.cliente) ...[
        _SwitchRow(
          label: 'Programmi',
          checked: preferences[NotificationType.newProgram] ?? true,
          onCheckedChange: (v) => onNotificationToggle(NotificationType.newProgram, v),
        ),
        _SwitchRow(
          label: 'Risposta richiesta coaching',
          checked: preferences[NotificationType.coachingRequestResult] ?? true,
          onCheckedChange: (v) =>
              onNotificationToggle(NotificationType.coachingRequestResult, v),
        ),
      ] else if (role == UserRole.coach) ...[
        _SwitchRow(
          label: 'Richieste di coaching',
          checked: preferences[NotificationType.coachingRequest] ?? true,
          onCheckedChange: (v) =>
              onNotificationToggle(NotificationType.coachingRequest, v),
        ),
      ],

      Text(
        'Sicurezza',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onPrimary
        ),
      ),

      if (changePasswordState.isLoading)
        const Center(child: CircularProgressIndicator())
      else
        ElevatedCardComp(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFieldComp(
                    label: 'Nuova password',
                    errorText: changePasswordState.newPasswordError,
                    onChanged: onNewPasswordChange,
                  ),
                  const SizedBox(height: 8),
                  TextFieldComp(
                    label: 'Conferma password',
                    errorText: changePasswordState.confirmPasswordError,
                    onChanged: onConfirmPasswordChange,
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: onChangePasswordClick,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.lightGreen,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text(
                        'Cambia password',
                      ),
                    ),
                  ),
                  if (changePasswordState.saveSuccess)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Salvata con successo!',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) => items[index],
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final String label;
  final bool checked;
  final void Function(bool) onCheckedChange;

  const _SwitchRow({
    super.key,
    required this.label,
    required this.checked,
    required this.onCheckedChange,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCardComp(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onPrimary,
                    ),
                  ),
                ),
                Switch(value: checked,
                  onChanged: onCheckedChange,
                  thumbColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return null;
                  }),),
              ],
            ),
          ),
        ]
    );
  }
}
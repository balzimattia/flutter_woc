import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_woc/auth/viewmodels/AuthViewModel.dart';
import 'package:flutter_woc/coaching/viewmodels/ClienteCoachingRelationViewModel.dart';
import 'package:flutter_woc/ui/AppTheme.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:flutter_woc/users/data/model/UserModel.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({
    super.key,
    required this.onClienteOwnCoachClick,
    required this.onSettingsClick,
    required this.onSearchCoachClick,
    required this.onRequestsListClick,
    required this.onLogoutSuccess,
  });

  final void Function(ClienteCoachingRelationViewModel vm) onClienteOwnCoachClick;
  final VoidCallback onSettingsClick;
  final VoidCallback onSearchCoachClick;
  final VoidCallback onRequestsListClick;
  final VoidCallback onLogoutSuccess;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  SessionStatus? _lastSessionStatus;

  @override
  Widget build(BuildContext context) {
    final authvm = context.watch<AuthViewModel>();
    final currentUser = authvm.currentUser;

    if (authvm.sessionStatus != _lastSessionStatus) {
      _lastSessionStatus = authvm.sessionStatus;
      if (authvm.sessionStatus == SessionStatus.notAuthenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.onLogoutSuccess();
        });
      }
    }

    return ChangeNotifierProvider(
      create: (_) => ClienteCoachingRelationViewModel()..getClienteOwnCoach(),
      child: Consumer<ClienteCoachingRelationViewModel>(
        builder: (context, vm, _) {
          final clienteOwnCoachState = vm.ownCoachState;

          if (clienteOwnCoachState.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return _UserContent(
            currentUser: currentUser,
            clienteOwnCoach: clienteOwnCoachState.ownCoach,
            ownCoachLoadError: clienteOwnCoachState.hasLoadingError,
            onSettingsClick: widget.onSettingsClick,
            onLogoutClick: () => authvm.logout(),
            onClienteOwnCoachClick: () => widget.onClienteOwnCoachClick(vm),
            onSearchCoachClick: widget.onSearchCoachClick,
            onRequestsListClick: widget.onRequestsListClick,
          );
        },
      ),
    );
  }
}


class _UserContent extends StatelessWidget {
  const _UserContent({
    super.key,
    required this.currentUser,
    required this.clienteOwnCoach,
    required this.ownCoachLoadError,
    required this.onSettingsClick,
    required this.onLogoutClick,
    required this.onClienteOwnCoachClick,
    required this.onSearchCoachClick, required this.onRequestsListClick
  });

  final UserModel? currentUser;
  final UserModel? clienteOwnCoach;
  final bool ownCoachLoadError;

  final VoidCallback onSettingsClick;
  final VoidCallback onLogoutClick;
  final VoidCallback onClienteOwnCoachClick;
  final VoidCallback onSearchCoachClick;
  final VoidCallback onRequestsListClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Center(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 35,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedCardComp(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    currentUser?.name ?? '',
                                    style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .onPrimary),
                                  ),
                                  Text(
                                    currentUser?.email ?? '',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Theme.of(context).colorScheme.onPrimary
                                    ),
                                  )
                                ]
                            )
                          ]
                      ),

                      if (currentUser?.role == UserRole.cliente)
                        ..._clienteContent(context, clienteOwnCoach, ownCoachLoadError, onClienteOwnCoachClick, onSearchCoachClick)
                      else if (currentUser?.role == UserRole.coach)
                        ..._coachContent(context, onRequestsListClick),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: ElevatedButton(
                          onPressed: () => onSettingsClick(),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                            backgroundColor: Theme.of(context).colorScheme.onPrimary,
                            disabledForegroundColor: Colors.white,
                            disabledBackgroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            elevation: 8,
                            minimumSize: const Size(double.infinity, 48),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: SvgPicture.asset(
                                      'assets/icons/settings.svg',
                                      colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.onPrimaryContainer,
                                        BlendMode.srcIn,
                                      ),
                                      height: 24,
                                      width: 24,
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.center,
                                  child: Text('Impostazioni'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      if (currentUser != null)
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: onLogoutClick,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red,
                              disabledForegroundColor: Colors.white,
                              disabledBackgroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              elevation: 8,
                            ),
                            child: const Text('Logout', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }


  List<Widget> _clienteContent(BuildContext context, UserModel? clienteOwnCoach,
      bool ownCoachLoadError, VoidCallback onClienteOwnCoachClick,
      VoidCallback onSearchCoachClick) =>
      [
        ElevatedCardComp(
            onClick: clienteOwnCoach != null ? onClienteOwnCoachClick : null,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Coach: ', style: TextStyle(fontSize: 26, color: Theme
                      .of(context)
                      .colorScheme
                      .onPrimary),),
                  Expanded(
                      child: Text(
                        ownCoachLoadError
                            ? 'Errore durante il caricamento'
                            : (clienteOwnCoach?.name ?? 'Ancora nessun coach'),
                        style: TextStyle(fontSize: 26,
                            color: ownCoachLoadError ? AppTheme.red : Theme
                                .of(context)
                                .colorScheme
                                .onPrimary),
                      )
                  )
                ],
              )
            ]
        ),

    if(clienteOwnCoach == null && !ownCoachLoadError)
      ElevatedCardComp(
        children: [
          ElevatedButton(
              onPressed: () => onSearchCoachClick(),
              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppTheme.lightGreen), elevation: WidgetStatePropertyAll(8)),
              child: Text('Stato richiesta', style: TextStyle(fontSize: 16, color: Color(0xff000000)),),
          )
        ]
      ) 
  ];


  List<Widget> _coachContent(BuildContext context, VoidCallback onRequestsListClick) => [
    ElevatedCardComp(
        children: [
          ElevatedButton(
            onPressed: () => onRequestsListClick(),
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppTheme.lightGreen), elevation: WidgetStatePropertyAll(8)),
            child: Text('Richieste di coaching clienti', style: TextStyle(fontSize: 16, color: Color(0xff000000)),),
          )
        ]
    )
  ];
}
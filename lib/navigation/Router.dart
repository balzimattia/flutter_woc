import 'package:flutter/material.dart';
import 'package:flutter_woc/coaching/screens/cliente/CoachingRequestScreen.dart';
import 'package:flutter_woc/coaching/screens/cliente/OwnCoachingRelationScreen.dart';
import 'package:flutter_woc/coaching/screens/coach/ClienteRequestScreen.dart';
import 'package:flutter_woc/coaching/screens/coach/CoachClientsListScreen.dart';
import 'package:flutter_woc/coaching/screens/coach/RequestsListScreen.dart';
import 'package:flutter_woc/navigation/Routes.dart';
import 'package:flutter_woc/notifications/screens/NotificationScreen.dart';
import 'package:flutter_woc/programs/screens/cliente/DayScreen.dart';
import 'package:flutter_woc/programs/screens/cliente/ExerciseScreen.dart';
import 'package:flutter_woc/programs/screens/cliente/ProgramsScreen.dart';
import 'package:flutter_woc/programs/screens/coach/ClienteInfoEProgramsScreen.dart';
import 'package:flutter_woc/programs/screens/coach/EditProgramScreen.dart';
import 'package:flutter_woc/users/screens/SettingsScreen.dart';
import 'package:flutter_woc/users/screens/UserScreen.dart';
import 'package:go_router/go_router.dart';
import '../auth/data/AuthRepository.dart';
import '../auth/screens/LoginScreen.dart';
import '../auth/screens/RegisterScreen.dart';
import '../coaching/viewmodels/ClienteCoachingRelationViewModel.dart';
import '../coaching/viewmodels/CoachCoachingRequestViewModel.dart';
import '../programs/data/models/ProgramSheet.dart';
import '../programs/viewmodels/ClienteProgramViewModel.dart';
import '../programs/viewmodels/CoachProgramViewModel.dart';
import '../users/screens/SearchCoachScreen.dart';
import '../ui/AppShell.dart';
import '../home/HomeScreen.dart';
import '../users/data/model/UserModel.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.homePath,
  refreshListenable: AuthRepository.instance.currentUser,
  redirect: (context, state) {
    final isLoggedIn = AuthRepository.instance.currentUser.value != null;
    final isPublicRoute =
        state.matchedLocation == AppRoutes.homePath ||
        state.matchedLocation == '/login' ||
        state.matchedLocation == '/register';

    // utente non logagto ritorna alla home, ma puo comunque andare in login e register
    if (!isLoggedIn && !isPublicRoute) {
      return AppRoutes.homePath;
    }
    return null;
  },

  routes: [
    ShellRoute(
      builder: (context, state, child) => AppShell(child: child),
      routes: [
        GoRoute(
          name: AppRoutes.loginName,
          path: AppRoutes.loginPath,
          builder: (context, state) =>
              LoginScreen(onLoginClick: () {
                context.navigateToHome();
              },),
        ),

        GoRoute(
            name: AppRoutes.registerName,
            path: AppRoutes.registerPath,
            builder: (context, state) =>
                RegisterScreen(onRegisterClick: () {
                  context.navigateToHome();
                },)
        ),


        GoRoute(
          name: AppRoutes.homeName,
          path: AppRoutes.homePath,
          builder: (context, state) =>
              HomeScreen(
                onRegisterClick: () {
                  context.pushNamed(AppRoutes.registerName);
                },
                onLoginClick: () {
                  context.pushNamed(AppRoutes.loginName);
                },
                onNextWorkoutClick: () {
                  context.pushNamed(AppRoutes.programsName, extra: true);
                },
              ),
        ),


        GoRoute(
          name: AppRoutes.programsName,
          path: AppRoutes.programsPath,
          builder: (context, state) =>
              ProgramsScreen(
                isNextWorkout: state.extra == true,
                onDayClick: (vm) =>
                    context.pushNamed(
                      AppRoutes.dayScreenName,
                      extra: vm,
                    ),
              ),
          routes: [
            GoRoute(
              name: AppRoutes.dayScreenName,
              path: AppRoutes.dayScreenPath,
              builder: (context, state) {
                final vm = state.extra as ClienteProgramViewModel;

                return DayScreen(
                  clienteProgramViewModel: vm,
                  onExerciseClick: (exerciseIndex) {
                    final programState = vm.currentProgramState;
                    final weekNumber = programState.currentWeekNumber;
                    final dayNumber = programState.currentDayNumber;

                    if (weekNumber == null || dayNumber == null) return;

                    final exercise = vm.getExercise(weekNumber, dayNumber, exerciseIndex);
                    if (exercise == null) return;

                    context.pushNamed(
                      AppRoutes.exerciseScreenName,
                      extra: (
                      exerciseIndex: exerciseIndex,
                      viewModel: vm,
                      exercise: exercise
                      ),
                    );
                  },
                );
              },
              routes: [
                GoRoute(
                  name: AppRoutes.exerciseScreenName,
                  path: AppRoutes.exerciseScreenPath,
                  builder: (context, state) {
                    final args = state.extra as ({
                    int exerciseIndex,
                    ClienteProgramViewModel viewModel,
                    Exercise exercise
                    });

                    return ExerciseScreen(
                      exerciseIndex: args.exerciseIndex,
                      clienteProgramViewModel: args.viewModel,
                      exercise: args.exercise,
                    );
                  },
                ),
              ],
            ),
          ],
        ),


        GoRoute(
            name: AppRoutes.coachClientiListName,
            path: AppRoutes.coachClientiListPath,
            builder: (context, state) =>
                CoachClientsListScreen(
                    onClienteClick: (UserModel cliente) =>
                    {
                      context.pushNamed(
                          AppRoutes.clienteInfoEProgramsName,
                          extra: cliente
                      )
                    }
                ),
            routes: [
              GoRoute(
                name: AppRoutes.clienteInfoEProgramsName,
                path: AppRoutes.clienteInfoEProgramsPath,
                builder: (context, state) {
                  final cliente = state.extra as UserModel;
                  return ClienteInfoEProgramsScreen(
                    cliente: cliente,
                    onProgramClick: (args) =>
                        context.pushNamed(
                          AppRoutes.editProgramName,
                          extra: args,
                        ),
                    onNewProgramClick: (args) =>
                        context.pushNamed(
                          AppRoutes.editProgramName,
                          extra: args,
                        ),
                  );
                },
                routes: [
                  GoRoute(
                    name: AppRoutes.editProgramName,
                    path: AppRoutes.editProgramPath,
                    builder: (context, state) {
                      final args = state.extra as ({
                      String clienteId,
                      ProgramSheet? program,
                      CoachProgramViewModel coachProgramViewModel,
                      });
                      return EditProgramScreen(
                        clienteId: args.clienteId,
                        program: args.program,
                        coachProgramViewModel: args.coachProgramViewModel,
                        onSaveSuccess: () => context.pop(),
                      );
                    },
                  ),
                ],
              ),
            ]
        ),


        GoRoute(
            name: AppRoutes.userName,
            path: AppRoutes.userPath,
            builder: (context, state) =>
                UserScreen(
                  onClienteOwnCoachClick: (
                      ClienteCoachingRelationViewModel vm) =>
                      context.pushNamed(
                          AppRoutes.ownCoachingRelationName,
                          extra: vm
                      ),
                  onSettingsClick: () {
                    context.pushNamed(AppRoutes.settingsName);
                  },
                  onSearchCoachClick: () {
                    context.pushNamed(AppRoutes.searchCoachName);
                  },
                  onRequestsListClick: () {
                    context.pushNamed(AppRoutes.requestsListName);
                  },
                  onLogoutSuccess: () {
                    context.navigateToHome();
                  },
                ),
            routes: [
              GoRoute(
                name: AppRoutes.searchCoachName,
                path: AppRoutes.searchCoachPath,
                builder: (context, state) =>
                    SearchCoachScreen(
                      onSelectedCoach: (coach) =>
                          context.pushNamed(
                            AppRoutes.coachingRequestName,
                            extra: coach,
                          ),
                      onCancelRequestClick: () {
                        context.navigateToUser();
                      },
                    ),
                routes: [
                  GoRoute(
                    name: AppRoutes.coachingRequestName,
                    path: AppRoutes.coachingRequestPath,
                    builder: (context, state) {
                      final coach = state.extra as UserModel;
                      return CoachingRequestScreen(
                        coach: coach, onInviaClick: () {
                        context.navigateToUser();
                      },);
                    },
                  ),
                ],
              ),

              GoRoute(
                  name: AppRoutes.ownCoachingRelationName,
                  path: AppRoutes.ownCoachingRelationPath,
                  builder: (context, state) {
                    final vm = state.extra as ClienteCoachingRelationViewModel;
                    return OwnCoachRelationScreen(
                        coachingRelationViewModel: vm,
                        onRemoveRelationClick: () => context.navigateToUser()
                    );
                  }
              ),

              GoRoute(
                  name: AppRoutes.requestsListName,
                  path: AppRoutes.requestsListPath,
                  builder: (context, state) =>
                      RequestsListScreen(
                        onSelectedUser: (cliente, vm) =>
                            context.pushNamed(
                              AppRoutes.clienteCoachingRequestName,
                              extra: (cliente: cliente, coachingRequestViewModel: vm),
                            ),
                      ),
                  routes: [
                    GoRoute(
                        name: AppRoutes.clienteCoachingRequestName,
                        path: AppRoutes.clienteCoachingRequestPath,
                        builder: (context, state) {
                          final args = state
                              .extra as ({UserModel cliente, CoachCoachingRequestViewModel coachingRequestViewModel});
                          return ClienteRequestScreen(
                              cliente: args.cliente,
                              coachingRequestViewModel: args
                                  .coachingRequestViewModel,
                              onButtonClick: () => context.pop()
                          );
                        }
                    )
                  ]
              ),

              GoRoute(
                name: AppRoutes.settingsName,
                path: AppRoutes.settingsPath,
                builder: (context, state) => SettingsScreen()
              )
            ]
        ),


        GoRoute(
            name: AppRoutes.notificationsName,
            path: AppRoutes.notificationsPath,
            builder: (context, state) => NotificationScreen(
                onRequestsClick: () => context.pushNamed(AppRoutes.requestsListName),
                onProgramClick: () => context.navigateToPrograms(),
                onRequestResultClick: () => context.navigateToUser()
            )
        )
      ],
    ),
  ],
);


extension AppNavigation on BuildContext {
  void navigateToHome() {
    goNamed(AppRoutes.homeName);
  }

  void navigateToPrograms() {
    goNamed(AppRoutes.homeName);
    pushNamed(AppRoutes.programsName);
  }

  void navigateToUser() {
    goNamed(AppRoutes.homeName);
    pushNamed(AppRoutes.userName);
  }

  void navigateToClientiList() {
    goNamed(AppRoutes.homeName);
    pushNamed(AppRoutes.coachClientiListName);
  }
}
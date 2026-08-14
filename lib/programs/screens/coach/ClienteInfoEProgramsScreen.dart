import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:provider/provider.dart';
import '../../../ui/AppTheme.dart';
import '../../../users/data/model/UserModel.dart';
import '../../data/models/ProgramSheet.dart';
import '../../viewmodels/CoachProgramViewModel.dart';


class ClienteInfoEProgramsScreen extends StatelessWidget {
  const ClienteInfoEProgramsScreen({
    super.key,
    required this.cliente,
    required this.onProgramClick,
    required this.onNewProgramClick,
  });

  final UserModel cliente;
  final void Function(({String clienteId, ProgramSheet? program, CoachProgramViewModel coachProgramViewModel})) onProgramClick;
  final void Function(({String clienteId, ProgramSheet? program, CoachProgramViewModel coachProgramViewModel})) onNewProgramClick;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoachProgramViewModel()..getClienteProgramsList(cliente.id),
      child: Consumer<CoachProgramViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoadingInfo) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            body: _ClienteInfoEProgramsContent(
              cliente: cliente,
              programList: vm.clienteProgramsList,
              onProgramClick: (program) => onProgramClick(
                (clienteId: cliente.id, program: program, coachProgramViewModel: vm),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => onNewProgramClick(
                (clienteId: cliente.id, program: null, coachProgramViewModel: vm),
              ),
              backgroundColor: AppTheme.lightGreen,
              foregroundColor: Colors.black,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class _ClienteInfoEProgramsContent extends StatelessWidget {
  const _ClienteInfoEProgramsContent({
    required this.cliente,
    required this.programList,
    required this.onProgramClick,
  });

  final UserModel cliente;
  final List<ProgramSheet> programList;
  final void Function(ProgramSheet) onProgramClick;

  @override
  Widget build(BuildContext context) {
    final reversedList = programList.reversed.toList();

    return ListView(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 80),
      children: [
        ElevatedCardComp(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      cliente.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onPrimary,
                      ),
                    ),
                    Text(
                      cliente.email,
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
        const SizedBox(height: 12),
        ...reversedList.map(
              (program) =>
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedCardComp(
                    onClick: () => onProgramClick(program),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Programma N. ${program.number}',
                              style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .onPrimary,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onPrimary,
                          ),
                        ],
                      ),
                    ]
                ),
          ),
        ),
      ],
    );
  }
}
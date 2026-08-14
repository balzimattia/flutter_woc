import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:provider/provider.dart';

import '../../../users/data/model/UserModel.dart';
import '../../viewmodels/CoachCoachingRequestViewModel.dart';

class RequestsListScreen extends StatelessWidget {
  const RequestsListScreen({super.key, required this.onSelectedUser});

  final void Function(UserModel cliente, CoachCoachingRequestViewModel vm) onSelectedUser;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoachCoachingRequestViewModel()..retrieveCoachingRequestsList(),
      child: Consumer<CoachCoachingRequestViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoadinRequestsList) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            body: _RequestsListContent(
              list: vm.coachingRequestsList,
              onSelectedUser: (cliente) => onSelectedUser(cliente, vm),
            ),
          );
        },
      ),
    );
  }
}

class _RequestsListContent extends StatelessWidget {
  const _RequestsListContent({
    required this.list,
    required this.onSelectedUser,
  });

  final List<UserModel> list;
  final void Function(UserModel) onSelectedUser;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Nessuna richiesta disponibile',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemCount: list.length,
      separatorBuilder: (_, _) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final user = list[index];
        return ElevatedCardComp(
            onClick: () => onSelectedUser(user),
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nome: ${user.name}',
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onPrimary,
                          ),
                        ),
                        Text(
                          'Email: ${user.email}',
                          style: TextStyle(
                            color: Theme
                                .of(context)
                                .colorScheme
                                .onPrimary,
                          ),
                        ),
                      ],
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
        );
      },
    );
  }
}
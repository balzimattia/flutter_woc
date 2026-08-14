import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/AppTheme.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../navigation/Routes.dart';
import '../../coaching/data/models/CoachingRequest.dart';
import '../../coaching/viewmodels/ClienteCoachingRequestViewModel.dart';
import '../data/model/UserModel.dart';
import '../states/SearchCoachState.dart';
import '../viewmodels/SearchCoachViewModel.dart';

class SearchCoachScreen extends StatelessWidget {
  const SearchCoachScreen({
    super.key,
    required this.onSelectedCoach,
    required this.onCancelRequestClick
  });

  final void Function(UserModel) onSelectedCoach;
  final VoidCallback onCancelRequestClick;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchCoachViewModel()),
        ChangeNotifierProvider(create: (_) => ClienteCoachingRequestViewModel()..getPendingRequest()),
      ],
      child: _SearchCoachContent(onSelectedCoach: onSelectedCoach, onCancelRequestClick: onCancelRequestClick,),
    );
  }
}

class _SearchCoachContent extends StatelessWidget {
  const _SearchCoachContent({
    required this.onSelectedCoach,
    required this.onCancelRequestClick
  });

  final void Function(UserModel) onSelectedCoach;
  final VoidCallback onCancelRequestClick;

  @override
  Widget build(BuildContext context) {
    final searchVm = context.watch<SearchCoachViewModel>();
    final requestVm = context.watch<ClienteCoachingRequestViewModel>();

    final searchState = searchVm.searchCoachState;
    final requestStatus = requestVm.requestStatus;
    final isLoadingRequest = requestVm.isLoadingRequestStatus;

    if (isLoadingRequest) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: switch (requestStatus) {
            RequestStatus.pending => _PendingContent(
              onCancelRequest: () {
                requestVm.deletePendingRequest();
                onCancelRequestClick();
              }
            ),

            RequestStatus.accepted => const Center(
              child: Text('Hai già un coach'),
            ),

            // _ è per null e rejected
            _ => _SearchContent(
              state: searchState,
              onSearchChange: searchVm.onSearchChange,
              onSearchClick: searchVm.searchCoaches,
              onSelectedCoach: onSelectedCoach,
            ),
          },
        ),
      ),
    );
  }
}


class _PendingContent extends StatelessWidget {
  const _PendingContent({required this.onCancelRequest});

  final VoidCallback onCancelRequest;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedCardComp(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              Text(
                'Hai già una richiesta in corso',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: onCancelRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Annulla richiesta'),
              ),
            ],
          ),
        ],
      ));
  }
}


class _SearchContent extends StatelessWidget {
  const _SearchContent({
    required this.state,
    required this.onSearchChange,
    required this.onSearchClick,
    required this.onSelectedCoach,
  });

  final SearchCoachState state;
  final ValueChanged<String> onSearchChange;
  final VoidCallback onSearchClick;
  final void Function(UserModel) onSelectedCoach;


  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController.fromValue(
      TextEditingValue(
        text: state.search,
        selection: TextSelection.collapsed(offset: state.search.length),
      ),
    );

    return Column(
      spacing: 12,
      children: [
        TextField(
          controller: textController,
          onChanged: onSearchChange,
          onSubmitted: (_) => onSearchClick(),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Ricerca coach',
            hintStyle: TextStyle(color: Colors.black),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: state.search.isNotEmpty
                ? IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () => onSearchChange(''),
            )
                : null,
            prefixIconColor: Colors.black,
            suffixIconColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
          style: const TextStyle(color: Colors.black),
        ),

        if (state.isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            ),
          )
        else
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: state.coachesList.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final coach = state.coachesList[index];
                return ElevatedCardComp(
                    onClick: () => onSelectedCoach(coach),
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coach.name,
                                  style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.onPrimary),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  coach.email,
                                  style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ]
                );
              },
            ),
          ),
      ],
    );
  }
}
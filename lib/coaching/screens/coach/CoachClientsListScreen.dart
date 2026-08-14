import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:provider/provider.dart';

import '../../../users/data/model/UserModel.dart';
import '../../viewmodels/ClientiListViewModel.dart';

class CoachClientsListScreen extends StatelessWidget {
  const CoachClientsListScreen({super.key, required this.onClienteClick});

  final void Function(UserModel) onClienteClick;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClientiListViewModel(),
      child: _CoachClientsListBody(onClienteClick: onClienteClick),
    );
  }
}

class _CoachClientsListBody extends StatefulWidget {
  const _CoachClientsListBody({required this.onClienteClick});

  final void Function(UserModel) onClienteClick;

  @override
  State<_CoachClientsListBody> createState() => _CoachClientsListBodyState();
}

class _CoachClientsListBodyState extends State<_CoachClientsListBody> {
  StreamSubscription? _errorSub;

  @override
  void initState() {
    super.initState();
    final vm = context.read<ClientiListViewModel>();
    _errorSub = vm.errorMessage.listen((message) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    });
  }

  @override
  void dispose() {
    _errorSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ClientiListViewModel>();

    if (vm.isLoadingClientiList) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: _CoachClientsListContent(
        clientiList: vm.clientiList,
        onClienteClick: widget.onClienteClick,
        onRemoveRelation: vm.removeRelationWithCliente,
      ),
    );
  }
}

class _CoachClientsListContent extends StatefulWidget {
  const _CoachClientsListContent({
    required this.clientiList,
    required this.onClienteClick,
    required this.onRemoveRelation,
  });

  final List<UserModel> clientiList;
  final void Function(UserModel) onClienteClick;
  final void Function(UserModel) onRemoveRelation;

  @override
  State<_CoachClientsListContent> createState() => _CoachClientsListContentState();
}

class _CoachClientsListContentState extends State<_CoachClientsListContent> {
  UserModel? _selectedCliente;
  String _search = '';

  List<UserModel> get _filteredList {
    if (_search.trim().isEmpty) return widget.clientiList;
    return widget.clientiList
        .where((c) => c.name.toLowerCase().contains(_search.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: TextField(
                  onChanged: (value) => setState(() => _search = value),
                  decoration: InputDecoration(
                    labelText: 'Cerca cliente',
                    prefixIcon: const Icon(Icons.search),
                    labelStyle: const TextStyle(color: Colors.lightBlue),
                    prefixIconColor: Colors.lightBlue,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.lightBlue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.lightBlue),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(15),
                  itemCount: _filteredList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final cliente = _filteredList[index];
                    final isSelected = _selectedCliente == cliente;

                    return ElevatedCardComp(
                      isSelected: isSelected,
                      onClick: () {
                        if (_selectedCliente != null) {
                          setState(() => _selectedCliente = null);
                        } else {
                          widget.onClienteClick(cliente);
                        }
                      },
                      onLongPress: () {
                        setState(() => _selectedCliente = cliente);
                      },
                      children: [
                        Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cliente.name,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                Text(
                                  cliente.email,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ],
                      ),
                    ]
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // pulsante rimuovi relazione quando tieni premuto
        Align(
          alignment: Alignment.topCenter,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) {
              final slide = Tween<Offset>(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(animation);
              return SlideTransition(
                position: slide,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: _selectedCliente != null
                ? Padding(
              key: const ValueKey('remove-button'),
              padding: const EdgeInsets.only(top: 8),
              child: ElevatedButton.icon(
                onPressed: () {
                  widget.onRemoveRelation(_selectedCliente!);
                  setState(() => _selectedCliente = null);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.delete),
                label: const Text('Rimuovi cliente dal coaching'),
              ),
            )
                : const SizedBox.shrink(key: ValueKey('empty')),
          ),
        ),
      ],
    );
  }
}
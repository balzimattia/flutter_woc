import 'package:flutter/material.dart';
import 'package:flutter_woc/ui/components/ElevatedCardComp.dart';
import 'package:provider/provider.dart';

import '../../data/models/ProgramSheet.dart';
import '../../viewmodels/ClienteProgramViewModel.dart';

class ProgramsScreen extends StatefulWidget {
  const ProgramsScreen({
    super.key,
    required this.onDayClick,
    this.isNextWorkout = false,
  });

  final void Function(ClienteProgramViewModel) onDayClick;
  final bool isNextWorkout;

  @override
  State<ProgramsScreen> createState() => _ProgramsScreenState();
}

class _ProgramsScreenState extends State<ProgramsScreen> {
  bool _hasNavigated = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClienteProgramViewModel(),
      child: Consumer<ClienteProgramViewModel>(
        builder: (context, vm, _) {
          final program = vm.currentProgramState.currentProgram;

          if (widget.isNextWorkout && !_hasNavigated) {
            if (vm.currentProgramState.isLoadingScreen || program == null) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            _hasNavigated = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.onDayClick(vm);
            });

            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (vm.currentProgramState.isLoadingScreen) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (program == null) {
            return Scaffold(
              body: Center(
                child: Text(
                  'Nessun programma disponibile',
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            );
          }

          return Scaffold(
            body: _ProgramsContent(
              isLoadingWeeks: vm.currentProgramState.isLoadingWeeks,
              currentProgram: program,
              latestProgramNum: vm.latestProgramNum,
              onProgramClick: vm.getProgram,
              onDayClick: (weekNumber, dayNumber) {
                vm.setCurrentDay(weekNumber, dayNumber);
                widget.onDayClick(vm);
              },
            ),
          );
        },
      ),
    );
  }
}

class _ProgramsContent extends StatelessWidget {
  const _ProgramsContent({
    required this.isLoadingWeeks,
    required this.currentProgram,
    required this.latestProgramNum,
    required this.onProgramClick,
    required this.onDayClick,
  });

  final bool isLoadingWeeks;
  final ProgramSheet currentProgram;
  final int latestProgramNum;
  final void Function(int) onProgramClick;
  final void Function(int weekNumber, int dayNumber) onDayClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (latestProgramNum > 0)
            _ActiveProgramDropdown(
              currentProgram: currentProgram,
              latestProgramNum: latestProgramNum,
              onProgramClick: onProgramClick,
            ),
          const SizedBox(height: 16),
          Expanded(
            child: isLoadingWeeks
                ? const Center(child: CircularProgressIndicator())
                : _WeeksContent(
              currentProgram: currentProgram,
              onDayClick: onDayClick,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActiveProgramDropdown extends StatefulWidget {
  const _ActiveProgramDropdown({
    required this.currentProgram,
    required this.latestProgramNum,
    required this.onProgramClick,
  });

  final ProgramSheet currentProgram;
  final int latestProgramNum;
  final void Function(int) onProgramClick;

  @override
  State<_ActiveProgramDropdown> createState() => _ActiveProgramDropdownState();
}

class _ActiveProgramDropdownState extends State<_ActiveProgramDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;


    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final overlaySize = overlay.size;
    final position = renderBox.localToGlobal(Offset.zero, ancestor: overlay);

    final availableHeight = overlaySize.height - position.dy - size.height - 10;

    _overlayEntry = OverlayEntry(
        builder: (context) =>
            Stack(
                children: [
                  Positioned.fill(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: _closeDropdown,
                    ),
                  ),
                  Positioned(
                    width: size.width,
                    child: CompositedTransformFollower(
                      link: _layerLink,
                      showWhenUnlinked: false,
                      offset: Offset(0, size.height + 4),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: availableHeight),
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            children: [
                              for (int i = 1; i <=
                                  widget.latestProgramNum; i++) ...[
                                ListTile(
                                  title: Text(
                                    'Programma N. $i',
                                    style: TextStyle(
                                      fontWeight: widget.currentProgram
                                          .number == i
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onTap: () {
                                    widget.onProgramClick(i);
                                    _closeDropdown();
                                  },
                                ),
                                if (i < widget.latestProgramNum)
                                  const Divider(height: 1,
                                      indent: 8,
                                      endIndent: 8,
                                      color: Colors.grey),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
            )
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: InkWell(
        onTap: _toggleDropdown,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Programmazione attiva',
            labelStyle: TextStyle(color: Theme
                .of(context)
                .colorScheme
                .onPrimary),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
                ),
            ),
            suffixIcon: Icon(_isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: Theme.of(context).colorScheme.onPrimary),
          ),
          child: Text(
            'Programma N. ${widget.currentProgram.number}',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}

class _WeeksContent extends StatefulWidget {
  const _WeeksContent({required this.currentProgram, required this.onDayClick});

  final ProgramSheet currentProgram;
  final void Function(int weekNumber, int dayNumber) onDayClick;

  @override
  State<_WeeksContent> createState() => _WeeksContentState();
}

class _WeeksContentState extends State<_WeeksContent> {
  int? _expandedIndex;

  @override
  void didUpdateWidget(covariant _WeeksContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentProgram.number != widget.currentProgram.number) {
      setState(() => _expandedIndex = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 10),
      itemCount: widget.currentProgram.weeks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final week = widget.currentProgram.weeks[index];
        final isExpanded = _expandedIndex == index;

        return ElevatedCardComp(
            onClick: () =>
                setState(() => _expandedIndex = isExpanded ? null : index),
            children: [
              Padding(padding: const EdgeInsetsGeometry.all(16),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Settimana ${week.number}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary,
                        ),
                      ),
                      Icon(
                        isExpanded ? Icons.keyboard_arrow_down : Icons
                            .arrow_forward_ios,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .onPrimary,
                      ),
                    ],
                  ),
                  if (isExpanded) ...[
                    const Divider(height: 24),
                    ...week.days.map(
                          (day) =>
                          InkWell(
                            onTap: () =>
                                widget.onDayClick(week.number, day.number),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12,
                                  horizontal: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    'Giorno ${day.number}',
                                    style: TextStyle(
                                      color: Theme
                                          .of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                    ),
                  ],
                ],
              ),
              )
            ]
        );
      },
    );
  }
}
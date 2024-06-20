import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/presentation/shrimpill/widgets/ill_view.dart';

import '../../blocs/shrimp_ill_bloc/shrimp_ill_bloc.dart';
import '../../blocs/shrimp_ill_bloc/shrimp_ill_status.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/error_fetch_view.dart';

class ShrimpIllScreen extends StatelessWidget {
  final TabController tabController;

  const ShrimpIllScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShrimpIllBloc>(
      create: (_) => ShrimpIllBloc()..add(const ShrimpIllFetch()),
      child: const ShrimpIllView(),
    );
  }
}

class ShrimpIllView extends StatefulWidget {
  const ShrimpIllView({super.key});

  @override
  State<ShrimpIllView> createState() => _ShrimpIllView();
}

class _ShrimpIllView extends State<ShrimpIllView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<ShrimpIllBloc>().add(const ShrimpIllFetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kabar Terbaru'),
      ),
      body: BlocBuilder<ShrimpIllBloc, ShrimpIllState>(
        builder: (context, state) {
          if (state.status == ShrimpIllStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == ShrimpIllStatus.success) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ShrimpIllBloc>().add(const ShrimpIllRefresh());
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.hasReachedMax
                    ? state.data.length
                    : state.data.length + 1,
                itemBuilder: (context, index) {
                  return index >= state.data.length
                      ? const Center(
                          child: CustomCircularProgressIndicator(),
                        )
                      : buildShrimpPrice(context, state, index);
                },
              ),
            );
          } else {
            return const ErrorFetchView();
          }
        },
      ),
    );
  }

  Widget buildShrimpPrice(
      BuildContext context, ShrimpIllState state, int index) {
    final shrimpIllData = state.data[index];
    return IllView(illData: shrimpIllData);
  }
}

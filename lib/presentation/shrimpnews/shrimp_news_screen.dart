import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/blocs/shrim_news_bloc/shrimp_news_bloc.dart';
import 'package:jala_test/presentation/shrimpnews/widgets/news_view.dart';

import '../../blocs/shrim_news_bloc/shrimp_news_status.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/error_fetch_view.dart';

class ShrimpNewsScreen extends StatelessWidget {
  final TabController tabController;

  const ShrimpNewsScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShrimpNewsBloc>(
      create: (_) => ShrimpNewsBloc()..add(const ShrimpNewsFetch()),
      child: const ShrimpNewsView(),
    );
  }
}

class ShrimpNewsView extends StatefulWidget {
  const ShrimpNewsView({super.key});

  @override
  State<ShrimpNewsView> createState() => _ShrimpNewsView();
}

class _ShrimpNewsView extends State<ShrimpNewsView> {
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
      context.read<ShrimpNewsBloc>().add(const ShrimpNewsFetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kabar Terbaru'),
      ),
      body: BlocBuilder<ShrimpNewsBloc, ShrimpNewsState>(
        builder: (context, state) {
          if (state.status == ShrimpNewsStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == ShrimpNewsStatus.success) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ShrimpNewsBloc>().add(const ShrimpNewsRefresh());
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
      BuildContext context, ShrimpNewsState state, int index) {
    final shrimpNewsData = state.data[index];
    return NewsView(newsData: shrimpNewsData);
  }
}

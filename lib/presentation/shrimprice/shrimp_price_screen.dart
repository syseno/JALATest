import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jala_test/blocs/shrim_price_bloc/shrimp_price_bloc.dart';
import 'package:jala_test/blocs/shrim_price_bloc/shrimp_price_status.dart';
import 'package:jala_test/presentation/shrimprice/widgets/supplier_view.dart';
import 'package:jala_test/presentation/widgets/error_fetch_view.dart';

import '../widgets/custom_circular_progress_indicator.dart';

class ShrimpPriceScreen extends StatelessWidget {
  final TabController tabController;

  const ShrimpPriceScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShrimpPriceBloc>(
      create: (_) => ShrimpPriceBloc()..add(const ShrimpPriceFetch()),
      child: const ShrimpPriceView(),
    );
  }
}

class ShrimpPriceView extends StatefulWidget {
  const ShrimpPriceView({super.key});

  @override
  State<ShrimpPriceView> createState() => _HomeViewState();
}

class _HomeViewState extends State<ShrimpPriceView> {
  late final ScrollController _scrollController;
  var sizeFilter = 20;
  var regionFilter = "Indonesia";
  var regionId = 0;
  var _dialogResultSize = "";
  var _dialogResultRegion = "";

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
      context.read<ShrimpPriceBloc>().add(const ShrimpPriceFetch());
    }
  }

  void _showCustomDialog(String buttonName, String buttonType) async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(buttonName: buttonName);
      },
    );

    if (result != null) {
      setState(() {
        if (buttonType == "size") {
          _dialogResultSize = result;
        } else {
          _dialogResultRegion = result;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [];
    for (int i = 20; i <= 200; i += 10) {
      numbers.add(i);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harga Terbaru'),
      ),
      body: BlocBuilder<ShrimpPriceBloc, ShrimpPriceState>(
        builder: (context, state) {
          if (state.status == ShrimpPriceStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == ShrimpPriceStatus.success) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ShrimpPriceBloc>().add(const ShrimpPriceRefresh());
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5.0,
                      backgroundColor: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.builder(
                            itemCount: numbers.length,
                            itemBuilder: (_, i) {
                              return TextButton(
                                child: Text(numbers[i].toString(),
                                    style: const TextStyle(fontSize: 18)),
                                onPressed: () {
                                  setState(() {
                                    sizeFilter = numbers[i];
                                  });
                                  Navigator.of(context).pop();
                                },
                              );
                            }),
                      ),
                    );
                  },
                );
              },
              child: Text(sizeFilter.toString()),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Text(regionFilter),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShrimpPrice(
      BuildContext context, ShrimpPriceState state, int index) {
    final shrimpPriceData = state.data[index];
    return SupplierView(shrimpPriceData: shrimpPriceData);
  }
}

class CustomDialog extends StatelessWidget {
  final String buttonName;

  const CustomDialog({super.key, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Custom Dialog from $buttonName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text('This is a custom dialog. Press OK to send data back.'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop('Data from $buttonName');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

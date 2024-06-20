import 'package:flutter/material.dart';
import 'package:jala_test/presentation/shrimpill/shrimp_ill_screen.dart';
import 'package:jala_test/presentation/shrimpnews/shrimp_news_screen.dart';
import 'package:jala_test/presentation/shrimprice/shrimp_price_screen.dart';

import '../../core/text_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(TextConstants.appTitle),
          bottom: TabBar(controller: tabController, tabs: const [
            Tab(text: TextConstants.titleTab_1),
            Tab(text: TextConstants.titleTab_2),
            Tab(text: TextConstants.titleTab_3),
          ]),
        ),
        body: TabBarView(controller: tabController, children: [
          ShrimpPriceScreen(
            tabController: tabController,
          ),
          ShrimpNewsScreen(
            tabController: tabController,
          ),
          ShrimpIllScreen(
            tabController: tabController,
          )
        ]));
  }
}

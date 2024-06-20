import 'package:flutter/material.dart';

class ScreenBody extends StatefulWidget {
  final String tabBarTitle;
  final TabController tabController;
  final IconData tabIcon;

  const ScreenBody(
      {super.key,
      required this.tabBarTitle,
      required this.tabController,
      required this.tabIcon});

  @override
  State<ScreenBody> createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade400,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.tabBarTitle,
              style: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

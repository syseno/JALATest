import 'package:flutter/material.dart';

class ErrorFetchView extends StatelessWidget {
  const ErrorFetchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Failed to fetch data.'),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jala_test/data/model/shrimp_ill_model.dart';

class ShrimpIllDetailScreen extends StatelessWidget {
  final ShrimpIllData detail;

  const ShrimpIllDetailScreen({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              detail.fullName ?? "Unknown",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              detail.createdAt ?? "",
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Icon(Icons.share, color: Colors.grey[600]),
                const SizedBox(width: 4.0),
                Text(
                  'Shares',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Spacer(),
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8.0),
                const Icon(Icons.facebook, color: Colors.blue),
                const SizedBox(width: 8.0),
                const Icon(Icons.email, color: Colors.blueAccent),
              ],
            ),
            const SizedBox(height: 16.0),
            Image.network(detail.image ?? ""),
            const SizedBox(height: 16.0),
            Html(
              data: detail.indication,
            ),
          ],
        ),
      ),
    );
  }
}

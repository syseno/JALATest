import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jala_test/data/model/shrimp_news_model.dart';

class ShrimpNewsDetailScreen extends StatelessWidget {
  final ShrimpNewsData detail;

  const ShrimpNewsDetailScreen({super.key, required this.detail});

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
              detail.title ?? "Unknown",
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
              data: detail.body,
            ),
          ],
        ),
      ),
    );
  }
}

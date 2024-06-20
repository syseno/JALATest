import 'package:flutter/material.dart';
import 'package:jala_test/data/model/shrimp_ill_model.dart';

import '../shrimp_ill_detail_screen.dart';

class IllView extends StatelessWidget {
  final ShrimpIllData illData;

  const IllView({super.key, required this.illData});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShrimpIllDetailScreen(detail: illData),
              ),
            );
          },
          child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(8.0)),
                    child: Image.network(
                      "https://media.istockphoto.com/id/162259311/photo/tiger-shrimp-isolated-on-white.jpg?s=612x612&w=0&k=20&c=Nipq_QFqoXd5JPDesF-lfEf4oO00yTlXfcZVBtrPRR0=",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          illData.fullName ?? "Unknown",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          illData.metaDescription ?? "Unknown",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          illData.createdAt ?? "Unknown",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.share, color: Colors.grey[600]),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:jala_test/data/model/shrimp_news_model.dart';
import 'package:jala_test/presentation/shrimpnews/shrimp_news_detail_screen.dart';

class NewsView extends StatelessWidget {
  final ShrimpNewsData newsData;

  const NewsView({super.key, required this.newsData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShrimpNewsDetailScreen(detail: newsData),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.network(
                    "https://qsuper.qld.gov.au/-/media/images/qsuperpw/news/news-placeholder-imagesss.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        newsData.title ?? "Unknown",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        newsData.excerpt ?? "Unknown",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        newsData.createdAt ?? "Unknown",
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
      ),
    );
  }
}

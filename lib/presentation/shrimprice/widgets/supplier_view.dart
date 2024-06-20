import 'package:flutter/material.dart';
import 'package:jala_test/data/model/shrimp_price_model.dart';

class SupplierView extends StatelessWidget {
  final ShrimpPriceData shrimpPriceData;

  const SupplierView({super.key, required this.shrimpPriceData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(shrimpPriceData
                          .creator?.avatar ??
                      "https://gravatar.com/avatar/27205e5c51cb03f862138b22bcb5dc20f94a342e744ff6df1b8dc8af3c865109"),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shrimpPriceData.occupation ?? "Unknown",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      (shrimpPriceData.remark ?? "Unknown").length > 20
                          ? '${(shrimpPriceData.remark ?? "Unknown").substring(0, 20)}...'
                          : (shrimpPriceData.remark ?? "Unknown"),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                (shrimpPriceData.creator?.emailVerified == true &&
                        shrimpPriceData.creator?.phoneVerified == true)
                    ? Container(
                        decoration: BoxDecoration(
                          color: Colors.amber[100],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.verified,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Terverifikasi',
                              style: TextStyle(
                                color: Colors.amber[800],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: const Row(
                          children: [
                            SizedBox(width: 4),
                            Text(
                              'Belum terverifikasi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              shrimpPriceData.createdAt ?? "Unknown",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              shrimpPriceData.region?.provinceName ?? "Unknown",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              shrimpPriceData.region?.regencyName ?? "Unknown",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "size 100",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'IDR ${shrimpPriceData.size100 ?? 0}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: const Text('LIHAT DETAIL'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

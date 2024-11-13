import 'package:flutter/material.dart';
import 'package:keywa_test_application/constant/colors.dart';
import 'package:keywa_test_application/data/model/crypto.dart';

class CryptoListTile extends StatelessWidget {
  final List<Crypto> mainCryptoList;

  const CryptoListTile({
    required this.mainCryptoList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView.builder(
      itemCount: mainCryptoList.length,
      itemBuilder: (context, index) {
        final crypto = mainCryptoList[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: CustomColor.blueAccent,
                child: Text(
                  '${crypto.rank}',
                  style: textTheme.bodyLarge?.copyWith(
                    color: CustomColor.white,
                  ),
                ),
              ),
              title: Text(
                crypto.name,
                style: textTheme.bodyLarge,
              ),
              subtitle: Text(
                crypto.symbol,
                style: textTheme.bodySmall,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${double.parse(crypto.priceUsd.toString()).toStringAsFixed(2)}',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${crypto.changePercent24hr.toStringAsFixed(2)}%',
                    style: textTheme.bodySmall?.copyWith(
                      color: crypto.changePercent24hr > 0
                          ? CustomColor.green
                          : CustomColor.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

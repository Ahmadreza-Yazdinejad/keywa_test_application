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
      physics: const BouncingScrollPhysics(),
      itemCount: mainCryptoList.length,
      itemBuilder: (context, index) {
        final crypto = mainCryptoList[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(mainCryptoList[index].imageUrl),
              ),
            ),
            title: Text(
              crypto.name,
              style: textTheme.bodyLarge!.copyWith(color: CustomColor.white),
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
                  crypto.price,
                  style: textTheme.bodyLarge!.copyWith(
                    color: crypto.change24Hour.contains('-')
                        ? CustomColor.red
                        : CustomColor.green,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${crypto.change24Hour}%',
                  style: textTheme.bodySmall?.copyWith(
                    color: crypto.change24Hour.contains('-')
                        ? CustomColor.red
                        : CustomColor.green,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

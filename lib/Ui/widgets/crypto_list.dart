import 'package:flutter/material.dart';
import 'package:keywa_test_application/data/model/crypto.dart';

class CryptoListTile extends StatelessWidget {
  final List<Crypto> mainCryptoList;
  const CryptoListTile({
    required this.mainCryptoList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            mainCryptoList[index].name,
          ),
          subtitle: Text(
            mainCryptoList[index].symbol,
          ),
          leading: Text(
            '${mainCryptoList[index].rank}',
          ),
          trailing: Text(
            '${mainCryptoList[index].priceUsd}',
          ),
        );
      },
    );
  }
}

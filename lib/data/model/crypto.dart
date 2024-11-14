class Crypto {
  final String imageUrl;
  final String name;
  final String symbol;
  final String price;
  final String change24Hour;

  Crypto({
    required this.imageUrl,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change24Hour,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    final coinInfo = json['CoinInfo'];
    final displayUsd = json['DISPLAY']['USD'];

    return Crypto(
      imageUrl: 'https://www.cryptocompare.com${coinInfo['ImageUrl']}',
      name: coinInfo['FullName'],
      symbol: coinInfo['Name'],
      price: displayUsd['PRICE'],
      change24Hour: displayUsd['CHANGE24HOUR'],
    );
  }
}

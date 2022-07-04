class Coin {
  final String ticker;
  final String fullName;
  final double price;
  final String imageUrl;

  final String algorithm;
  final num blockNumber;
  final num blockTime;
  final num blockReward;
  final String assetLaunchDate;
  final num maxSupply;

  const Coin({
    required this.ticker,
    required this.fullName,
    required this.price,
    required this.imageUrl,
    required this.algorithm,
    required this.blockNumber,
    required this.blockTime,
    required this.blockReward,
    required this.assetLaunchDate,
    required this.maxSupply,
  });

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      fullName: map['CoinInfo']?['FullName'] ?? '',
      ticker: map['CoinInfo']?['Name'] ?? '',
      price: (map['RAW']?['USD']?['PRICE'] ?? 0).toDouble(),
      // ignore: prefer_interpolation_to_compose_strings
      imageUrl: "https://cryptocompare.com" + map['CoinInfo']?['ImageUrl'],
      algorithm: map['CoinInfo']?['Algorithm'] ?? '',
      blockNumber: map['CoinInfo']?['BlockNumber'] ?? 0,
      blockTime: map['CoinInfo']?['BlockTime'] ?? 0,
      blockReward: map['CoinInfo']?['BlockReward'] ?? 0,
      assetLaunchDate: map['CoinInfo']?['AssetLaunchDate'] ?? '',
      maxSupply: map['CoinInfo']?['MaxSupply'] ?? 0,
    );
  }

  //  static Future<List<CoinData>> getCoinHourlyData(String ticker) async {
  //   final requestUrl =
  //       '${_baseUrl}data/v2/histohour?fsym=$ticker&tsym=USD&limit=25';

  //   try {
  //     final response = await http.Client().get(Uri.parse(requestUrl));
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body) as Map<String, dynamic>;
  //       final data = json['Data']['Data'] as List<dynamic>;

  //       return data.map((e) {
  //         return CoinData.fromMap(e);
  //       }).toList();
  //     } else {
  //       throw Exception('Failed to load currencies');
  //     }
  //   } catch (err) {
  //     throw DataError(message: err.toString());
  //   }
  // }
}

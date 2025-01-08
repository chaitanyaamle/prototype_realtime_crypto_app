// To parse this JSON data, do
//
//     final cryptoCoins = cryptoCoinsFromJson(jsonString);

import 'dart:convert';

List<CryptoCoins> cryptoCoinsFromJson(String str) => List<CryptoCoins>.from(
    json.decode(str).map((x) => CryptoCoins.fromJson(x)));

String cryptoCoinsToJson(List<CryptoCoins> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CryptoCoins {
  final int id;
  final String name;
  final String symbol;
  final double value;
  final double changePer;
  final List<dynamic> history;

  CryptoCoins({
    required this.id,
    required this.name,
    required this.symbol,
    required this.value,
    required this.changePer,
    required this.history,
  });

  factory CryptoCoins.fromJson(Map<String, dynamic> json) => CryptoCoins(
      id: json["id"],
      name: json["name"],
      symbol: json["symbol"],
      value: json["value"]?.toDouble(),
      changePer: json["changePer"]?.toDouble(),
      history: json["history"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "value": value,
        "changePer": changePer,
        "history": history
      };
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_crypto/Models/crypto_coin.dart';
import 'package:realtime_crypto/Services/socket_service.dart';
import 'package:realtime_crypto/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({super.key});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  late SocketService socketService;

  List<CryptoCoins> crypto_data = [];
  Map<String, bool> isActive = {};

  @override
  void initState() {
    super.initState();
    print("--init--");
    fetchApi();
    socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on("cryptoUpdate", (data) {
      fetchApi();
    });
  }

  fetchApi() async {
    try {
      final response = await Dio().get("http://$localhost:3000/cryptos");
      if (response.statusCode == 200) {
        setState(() {
          final cryptoCoins = cryptoCoinsFromJson(jsonEncode(response.data));
          crypto_data = cryptoCoins;
        });
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        final cryptoCoins = cryptoCoinsFromJson(jsonEncode(object));
        crypto_data = cryptoCoins;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Currency"),
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: crypto_data.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      isActive.update(crypto_data[index].symbol, (val) => !val,
                          ifAbsent: () => true);
                    });
                  },
                  title: Text(
                    crypto_data[index].name,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(
                    "${crypto_data[index].symbol}",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  trailing: Text(
                    "\$${crypto_data[index].value}",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: crypto_data[index].changePer < 0
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ),
                if (isActive[crypto_data[index].symbol] ?? false)
                  Container(
                    height: 200,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: [
                        AreaSeries(
                          borderColor: Colors.blue.shade800,
                          color: Colors.blue.withAlpha(100),
                          dataSource: crypto_data[index].history,
                          xValueMapper: (data, index) => index,
                          yValueMapper: (data, index) => data,
                        ),
                      ],
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_crypto/Models/crypto_coin.dart';
import 'package:realtime_crypto/Services/socket_service.dart';
import 'package:http/http.dart' as http;

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({super.key});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  late SocketService socketService;

  List<CryptoCoins> crypto_data = [];

  @override
  void initState() {
    super.initState();
    print("--init--");
    socketService = Provider.of<SocketService>(context, listen: false);
    socketService.socket.on("cryptoUpdate", (data) {
      fetchApi();
    });
  }

  fetchApi() async {
    final url = Uri.parse("http://localhost:3000/cryptos");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          var data = cryptoCoinsFromJson(response.body);
          crypto_data = data;
        });
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
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
            return ListTile(
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
            );
          },
        ),
      ),
    );
  }
}

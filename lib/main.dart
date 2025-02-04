import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realtime_crypto/Screens/crypto_screen.dart';
import 'package:realtime_crypto/Services/socket_service.dart';
import 'package:realtime_crypto/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocketService()..initSocket("http://$localhost:3000"),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: CryptoScreen()),
    );
  }
}

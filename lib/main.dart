import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/app_config.dart';
import 'config/dependency_injector.dart';
import 'services/secure_storage_service.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  if (!AppConfig.isConfigured()) {
    print('⚠️ Konfigurasi .env tidak lengkap.');
  }

  // Cek apakah token sudah ada di secure storage sebelum app dijalankan
  final secureStorage = SecureStorageService();
  final bool hasToken = await secureStorage.hasToken();

  runApp(
    DependencyInjector(
      child: MyApp(initialRouteIsHome: hasToken),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool initialRouteIsHome;

  const MyApp({super.key, required this.initialRouteIsHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPL & Keamanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Jika ada token, langsung ke HomeScreen. Jika tidak, ke LoginScreen.
      home: initialRouteIsHome ? const HomeScreen() : const LoginScreen(),
    );
  }
}
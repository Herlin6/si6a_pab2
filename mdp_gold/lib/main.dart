// Import package material design dari Flutter untuk komponen UI
import 'package:flutter/material.dart';
// Import package firebase_core untuk inisialisasi Firebase
import 'package:firebase_core/firebase_core.dart';
// Import konfigurasi Firebase yang di-generate otomatis oleh FlutterFire CLI
import 'firebase_options.dart';
// Import halaman PriceListScreen yang akan ditampilkan
import 'package:mdp_gold/screens/price_list_screen.dart';

void main() async {
  // Memastikan binding Flutter sudah siap sebelum menjalankan kode async
  WidgetsFlutterBinding.ensureInitialized();
  // Inisialisasi Firebase dengan konfigurasi sesuai platform (Android/Web/Windows)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Menjalankan aplikasi Flutter dengan widget MainApp
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PriceListScreen(),
    );
  }
}

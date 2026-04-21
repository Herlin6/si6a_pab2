// Import package material design dari Flutter untuk komponen UI
import 'package:flutter/material.dart';
// Import package firebase_core untuk inisialisasi Firebase
import 'package:firebase_core/firebase_core.dart';
// Import konfigurasi Firebase yang di-generate otomatis oleh FlutterFire CLI
import 'firebase_options.dart';
// Import halaman ShoppingListScreen yang akan ditampilkan
import 'package:belajar_uts/screens/tesScreen.dart';

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
  // Constructor dengan parameter key opsional
  const MainApp({super.key});

  // Method build untuk membangun tampilan UI
  @override
  Widget build(BuildContext context) {
    // MaterialApp adalah widget root yang menyediakan tema dan navigasi
    return MaterialApp(
      // Judul aplikasi (muncul di task manager/tab browser)
      title: 'Hargam Emas',
      // Menghilangkan banner "DEBUG" di pojok kanan atas
      debugShowCheckedModeBanner: false,
      // Konfigurasi tema aplikasi
      theme: ThemeData(
        // Warna utama aplikasi menggunakan warna hijau
        colorSchemeSeed: Colors.green,
        // Menggunakan Material Design 3
        useMaterial3: true,
      ),
      // Halaman utama yang ditampilkan saat aplikasi pertama kali dibuka
      home: const ShoppingListScreen(),
    );
  }
}

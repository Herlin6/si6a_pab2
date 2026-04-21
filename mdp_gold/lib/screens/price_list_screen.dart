import "package:flutter/material.dart";
import "package:firebase_database/firebase_database.dart";
import "package:mdp_gold/services/gold_service.dart";
import "package:mdp_gold/screens/login_screen.dart";
import "package:mdp_gold/services/auth_service.dart";

class PriceListScreen extends StatefulWidget {
  const PriceListScreen({super.key});

  @override
  State<PriceListScreen> createState() => _PriceListScreenState();
}

class _PriceListScreenState extends State<PriceListScreen> {
  final GoldService _goldService = GoldService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Harga Emas"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              await _authService.signOut();
              if (mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder<DatabaseEvent>(
        stream: _goldService.getPriceList(),
        builder: (context, snapshot) {
          // Menampilkan loading indicator saat menunggu data pertama kali
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Menampilkan pesan error jika terjadi kesalahan
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Mengambil data dari snapshot Firebase
          final data = snapshot.data?.snapshot.value;

          // Cek apakah data null atau bukan Map
          if (data == null || data is! Map) {
            return const Center(child: Text("Data tidak tersedia"));
          }

          // Mengkonversi data dari Firebase (Map) ke dalam bentuk Map Dart
          final Map<dynamic, dynamic> itemsMap = data;
          // Mengubah Map menjadi List agar bisa diiterasi
          final items = itemsMap.entries.toList();

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              // Mengkonversi value item menjadi Map<String, dynamic>
              final item = Map<String, dynamic>.from(
                items[index].value as Map,
              );
              // Mengambil nama barang dari data item
              final String tanggal = item['tanggal']?.toString() ?? '';
              final String harga = item['harga']?.toString() ?? '';

              return ListTile(
                title: Text(harga),
                subtitle: Text(tanggal),
              );
            },
          );
        },
      ),
    );
  }
}

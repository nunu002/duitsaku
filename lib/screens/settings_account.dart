import 'package:flutter/material.dart';
import 'package:expensivetracker/services/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsAccount extends StatelessWidget {
  SettingsAccount({super.key});
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF219EBC),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [

          UserAccountsDrawerHeader(
            accountName: Text("Nama Pengguna"),
            accountEmail: Text("email@example.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          SizedBox(
              width: 250,
              child:
              Text("Pengaturan",
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold,letterSpacing:10.0))
                ,)),
          ListTile(
            leading: Icon(Icons.edit), // Ikon akun
            title: Text('Ubah Nama Pengguna'),
            onTap: () {
              // Tambahkan logika untuk mengubah nama pengguna
              // Mungkin menggunakan showDialog dan TextField
            },
          ),
          ListTile(
            leading: Icon(Icons.lock), // Ikon kunci
            title: Text('Ubah Kata Sandi'),
            onTap: () {
              // Tambahkan logika untuk mengubah kata sandi
              // Mungkin menggunakan showDialog dan TextField
            },
          ),
          ListTile(
            leading: Icon(Icons.palette), // Ikon palet
            title: Text('Pengaturan Tema Aplikasi'),
            onTap: () {
              // Tambahkan logika untuk mengubah tema aplikasi
              // Mungkin menggunakan showDialog dan opsi pilihan tema
            },
          ),
          ListTile(
            leading: Icon(Icons.language), // Ikon bahasa
            title: Text('Pengaturan Bahasa Aplikasi'),
            onTap: () {
              // Tambahkan logika untuk mengubah bahasa aplikasi
              // Mungkin menggunakan showDialog dan opsi pilihan bahasa
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app), // Ikon keluar
            title: Text('Keluar'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

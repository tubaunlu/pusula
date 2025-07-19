import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/addbalance_screen.dart';
import 'package:flutter_application_5/screens/addcustomer_screen.dart';
import 'package:flutter_application_5/screens/balancepage_screen.dart';
import 'package:flutter_application_5/screens/customerlist_screen.dart';
import 'package:flutter_application_5/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PusulaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PusulaAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        final String? kullanici = snapshot.data?.getString("Kullanici");
  final Map<String, dynamic> responseBody = jsonDecode(kullanici!);
        return AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            children: [
              Icon(Icons.home, color: Colors.black),
              SizedBox(width: 8),
              Text(
                'Esnaf Pusulası',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CustomerListScreen()),
                );
              },
              child: const Text(
                "Müşteri Listesi",
                style: TextStyle(color: Colors.black),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AddCustomerScreen()),
                );
              },
              child: const Text(
                "Müşteri Ekle",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBalanceScreen()),
                );
              },
              child: const Text(
                "Bakiye Ekle",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Text(responseBody["result"]["UserName"]+" - Çıkış Yap" ??"",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }
}
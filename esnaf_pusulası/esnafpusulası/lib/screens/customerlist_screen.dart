import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'balancepage_screen.dart';
import 'addcustomer_screen.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  static const _textPrimary = Color(0xFF0D141C);
  static const _accentBlue = Color(0xFFE7EDF4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.home, color: Colors.black),
            const SizedBox(width: 8),
            const Text(
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
            onPressed: () {},
            child: const Text(
              "Müşteri Listesi",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Müşteri Bakiyeleri",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddCustomerScreen()),
              );
            },
            child: const Text(
              "Müşteri Ekle",
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Bakiye Ekle",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text("Kullanıcı Girişi",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 960),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Müşteri Listesi',
                      style: GoogleFonts.inter(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: _textPrimary,
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor:_textPrimary,
                        foregroundColor: _accentBlue,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AddCustomerScreen()),
                        );
                      },
                      child: const Text(
                        'Yeni Müşteri Ekle',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _CustomerTable(context),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.white,
        // ignore: sort_child_properties_last
        child: const Icon(Icons.arrow_back, color: Colors.black),
        tooltip: 'Geri',
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _CustomerTable(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Müşteri 1'),
            subtitle: const Text('Detaylar...'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BalancePageScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Müşteri 2'),
            subtitle: const Text('Detaylar...'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BalancePageScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
  
  // ignore: non_constant_identifier_names
  BalancePageScreen() {}
}


  
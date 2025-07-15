import 'package:flutter/material.dart';
import 'addcustomer_screen.dart';
import 'addbalance_screen.dart';
import 'customerlist_screen.dart';

class BalancePageScreen extends StatelessWidget {
  const BalancePageScreen({super.key});

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
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const BalancePageScreen()),
              );
            },
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
              child: const Text(
                "Kullanıcı Girişi",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Müşteri Bakiyeleri',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddBalanceScreen()),
                );
              },
              child: Card(
                color: Colors.white, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Colors.white),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.white, 
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Table(
                          columnWidths: const {
                            0: FractionColumnWidth(0.3),
                            1: FractionColumnWidth(0.3),
                            2: FractionColumnWidth(0.2),
                            3: FractionColumnWidth(0.2),
                          },
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              children: const [
                                TableCell(child: Text('Müşteri Adı', style: TextStyle(fontWeight: FontWeight.bold))),
                                TableCell(child: Text('Soyadı', style: TextStyle(fontWeight: FontWeight.bold))),
                                TableCell(child: Text('Bakiye Tutarı', style: TextStyle(fontWeight: FontWeight.bold))),
                                TableCell(child: Text('Son Güncelleme Tarihi', style: TextStyle(fontWeight: FontWeight.bold))),
                              ],
                            ),
                            // rastgele verilerle test edildi -> Gerçek veri için API entegrasyonu yapılması bekleniyor
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              children: const [
                                TableCell(child: Text('Ayşe')),
                                TableCell(child: Text('Yılmaz')),
                                TableCell(child: Text('1500 TL')),
                                TableCell(child: Text('2024-07-26')),
                              ],
                            ),
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              children: const [
                                TableCell(child: Text('Mehmet')),
                                TableCell(child: Text('Öztürk')),
                                TableCell(child: Text('2200 TL')),
                                TableCell(child: Text('2024-07-25')),
                              ],
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

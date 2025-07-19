import 'package:flutter/material.dart';
import 'package:flutter_application_5/widget/pusula_appbar.dart';
import 'addcustomer_screen.dart';
import 'addbalance_screen.dart';
import 'customerlist_screen.dart';
import 'package:intl/intl.dart';

class BalancePageScreen extends StatelessWidget {
  final Map<String, dynamic> customer;
  const BalancePageScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: PusulaAppBar(), 
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
                                TableCell(child: Text('Bakiye Tutarı', style: TextStyle(fontWeight: FontWeight.bold))),
                                TableCell(child: Text('Kayıt Tarihi', style: TextStyle(fontWeight: FontWeight.bold))),
                              
                              ],
                            ),
                          
                            TableRow(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              children:  [
                                TableCell(child: Text(customer["AdSoyad"] ?? '')),
                                TableCell(child: Text(customer['Bakiye'].toString())),
                                TableCell(child: Text(customer["KayitTarihi"].toString().substring(0,10))),
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

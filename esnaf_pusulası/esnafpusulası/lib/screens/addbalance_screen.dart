import 'package:flutter/material.dart';

class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), 
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
                children: [
                // Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xFFededed))),
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                    Row(
                    children: [
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
                      onPressed: () {},
                      child: const Text(
                        "Müşteri Bakiyeleri",
                        style: TextStyle(color: Colors.black),
                      ),
                      ),
                      TextButton(
                      onPressed: () {},
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
                  ],
                  ),
                ),
              
                Expanded(
                  child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Column(
                    children: [
                      Center(
                      child: Container(
                        width: 520,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                          // ignore: deprecated_member_use
                          color: const Color(0xFF000000).withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                          ),
                        ],
                        ),
                        padding: const EdgeInsets.all(24),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                              'Bakiye Ekle',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF141414),
                              ),
                              ),
                              SizedBox(height: 4),
                              Text(
                              'Haziran 26, 2025',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              ),
                            ],
                            ),
                          ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                          children: [
                            Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFededed),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                              Text(
                                'Bakiye Ekle',
                                style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF141414),
                                ),
                              ),
                              Text(
                                '\$12,000',
                                style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF141414),
                                ),
                              ),
                              ],
                            ),
                            ),
                          ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF141414),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('İşlem Ekle'),
                            ),
                            const SizedBox(width: 16),
                            OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF141414),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              side: const BorderSide(color: Color(0xFF141414)),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('İşlemleri Görüntüle'),
                            ),
                          ],
                          ),
                        ],
                        ),
                      ),
                      ),
                    ],
                    ),
                  ),
                  ),
                              ),
                              ]
                            );
                          },
                        ),
                      ),
                    );
                }
}
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http; // Import http package
import 'dart:convert'; // Import for JSON decoding

import 'balancepage_screen.dart';
import 'addcustomer_screen.dart';

// --- CustomerListScreen (StatefulWidget) ---
class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  static const _textPrimary = Color(0xFF0D141C);
  static const _accentBlue = Color(0xFFE7EDF4);

  List<dynamic> _customers = []; // To store fetched customer data
  bool _isLoading = true; // To manage loading state
  final TextEditingController _searchController = TextEditingController();
  String _currentSearchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchCustomers(); // Fetch customers when the screen initializes
    _searchController.addListener(() {
      // Add a listener to update search query and refetch
      if (_searchController.text != _currentSearchQuery) {
        setState(() {
          _currentSearchQuery = _searchController.text;
        });
        _fetchCustomers();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose the controller
    super.dispose();
  }

  // --- getPusulaList integrated here ---
  Future<void> _fetchCustomers() async {
    setState(() {
      _isLoading = true; // Set loading to true before fetching
    });

    final int take = 10; // You can make this dynamic if needed
    final int skip = 0; // You can make this dynamic if needed
    final String search = _currentSearchQuery; // Use the current search query

    final Uri url =
        Uri.parse('https://pusula-api-netcore.necmettincimen.xyz/list').replace(
          queryParameters: {
            'take': take.toString(),
            'skip': skip.toString(),
            'search': search,
          },
        );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        final List<dynamic> fetchedCustomers = responseBody['result'] ?? [];
        setState(() {
          _customers = fetchedCustomers; // Update the customers list
        });
        if (kDebugMode) {
          print(
          'GET request successful! Fetched ${fetchedCustomers.length} customers.',
        );
        }
      } else {
        if (kDebugMode) {
          print('GET request failed with status: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Response body: ${response.body}');
        }
        setState(() {
          _customers = []; // Clear customers on error
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during GET request: $e');
      }
      setState(() {
        _customers = []; // Clear customers on error
      });
    } finally {
      setState(() {
        _isLoading =
            false; // Set loading to false after fetching (success or failure)
      });
    }
  }

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
                        backgroundColor: _textPrimary,
                        foregroundColor: _accentBlue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddCustomerScreen(),
                          ),
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
                // --- Search Bar ---
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Müşteri ara...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                  onSubmitted: (value) {
                    _fetchCustomers(); // Fetch when user submits (presses enter)
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        ) // Show loading spinner
                      : _customers.isEmpty && _currentSearchQuery.isEmpty
                      ? const Center(
                          child: Text('Henüz müşteri yok.'),
                        ) // No customers initially
                      : _customers.isEmpty && _currentSearchQuery.isNotEmpty
                      ? const Center(
                          child: Text(
                            'Aradığınız kriterlere uygun müşteri bulunamadı.',
                          ),
                        ) // No customers for search
                      : _CustomerTable(
                          context,
                          _customers,
                        ), // Pass the fetched customers
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
        tooltip: 'Geri',
        child: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    );
  }

  // --- Modified _CustomerTable to accept customer data ---
  // ignore: non_constant_identifier_names
  Widget _CustomerTable(BuildContext context, List<dynamic> customers) {
    if (customers.isEmpty) {
      return const Center(child: Text('Müşteri bulunamadı.'));
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: ListView.builder(
        itemCount: customers.length,
        itemBuilder: (context, index) {
          final customer = customers[index];

          final String customerName =
              customer['AdSoyad'] ?? 'Bilinmeyen Müşteri';
          // You can choose what to display as subtitle.
          // For example, their balance:
          final String customerBalance =
              customer['Bakiye']?.toStringAsFixed(2) ??
              '0.00'; // Format as currency
          final String customerSubtitle =
              'Bakiye: $customerBalance TL'; // Or use other fields like EPosta, CepTel

          // Or if you want to use email/phone if available
          // final String customerEmail = customer['EPosta'] ?? '';
          // final String customerPhone = customer['CepTel'] ?? '';
          // String customerSubtitle = '';
          // if (customerEmail.isNotEmpty) customerSubtitle += customerEmail;
          // if (customerPhone.isNotEmpty) customerSubtitle += (customerEmail.isNotEmpty ? ' | ' : '') + customerPhone;
          // if (customerSubtitle.isEmpty) customerSubtitle = 'Detay yok';

          // ignore: unused_local_variable
          final String customerId =
              customer['CKartNum']?.toString() ??
              'unknown_id'; // Using CKartNum as ID

          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(customerName),
            subtitle: Text(customerSubtitle), // Using the new subtitle
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BalancePageScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

class BalancePageScreen extends StatelessWidget {
  const BalancePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Müşteri Bakiyeleri'),
      ),
      body: const Center(
        child: Text('Balance Page Content'),
      ),
    );
  }
}
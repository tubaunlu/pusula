import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/addcustomer_screen.dart';
import 'package:flutter_application_5/services/balance_service.dart';
import 'balancepage_screen.dart';
import 'customerlist_screen.dart';


class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
 final TextEditingController bakiyeController = TextEditingController();
 Future<void> updateCustomerBalance() async {
  final BalanceService balanceService = BalanceService();
  final String customerNum = 'your_customer_id'; // Replace with actual customer ID
  final int newBalance = int.parse(bakiyeController.text); // Replace with the desired balance

  bool success = await balanceService.updateBalance(customerNum, newBalance);

  if (success) {
    // Handle successful update (e.g., show a success message)
    print('Balance update operation completed successfully.');
  } else {
    // Handle failed update (e.g., show an error message)
    print('Balance update operation failed.');
  }
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
          
                Expanded(
                  child: Center(
                    child: Container(
                      width: 400, 
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const CustomerListScreen()),
                                  );
                                },
                              ),
                              const SizedBox(width: 8),
                              const Text('Bakiye Ekle', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 20),
                        
                          const Text('Müşteri', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 48,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Müşteri Seç',   
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                
                          const Text('Bakiye Tutarı', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 48,
                            
                          child: TextField(
                            controller : bakiyeController,
                              decoration: InputDecoration(
                                hintText: '0,00',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        
                         const SizedBox(height: 20),
                        
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: updateCustomerBalance,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                minimumSize: const Size(84, 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'Onayla',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
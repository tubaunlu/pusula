import 'package:flutter/material.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Müşteri Listesi')),
      body: const Center(child: Text('Müşteri listesi burada görünecek.')),
    );
  }
}

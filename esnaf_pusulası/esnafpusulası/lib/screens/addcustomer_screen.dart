import 'package:flutter/material.dart';
import 'package:flutter_application_5/widget/pusula_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'balancepage_screen.dart';
import 'addbalance_screen.dart';
class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  static const _textPrimary = Color(0xFF0D141C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: PusulaAppBar(), 
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Müşteri Ekle',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: _textPrimary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: nameController,
                          label: 'Ad-Soyad',
                          hint: 'Müşteri Adı-Soyadı',
                          validator: (value) =>
                              value!.isEmpty ? 'Adınızı ve Soyadınızı giriniz' : null,
                          maxLines: 1,
                          height: 48,
                        ),
                        _buildTextField(
                          controller: phoneController,
                          label: 'İletişim Numarası',
                          hint: 'Telefon Numarası',
                          validator: (value) =>
                              value!.isEmpty ? 'Telefon numarasını giriniz' : null,
                          maxLines: 1,
                          height: 48,
                        ),
                        _buildTextField(
                          controller: addressController,
                          label: 'Adres',
                          hint: 'Müşteri Adresi',
                          validator: (value) =>
                              value!.isEmpty ? 'Adres giriniz' : null,
                          maxLines: 3,
                          height: 72,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Müşteri başarıyla eklendi!'),
                                ),
                              );
                            }
                          },
                          // ignore: sort_child_properties_last
                          child: const Text('Müşteri Ekle'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required String? Function(String?) validator,
    int maxLines = 1,
    double height = 48,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: height,
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}

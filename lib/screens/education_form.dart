import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formkey = GlobalKey<FormState>();

  final _institutionController = TextEditingController();
  final _programController = TextEditingController();
  final _startYearController = TextEditingController();
  final _endYearController = TextEditingController();

  bool _isOngoing = true;

  @override
  void dispose() {
    _institutionController.dispose();
    _programController.dispose();
    _startYearController.dispose();
    _endYearController.dispose();
    super.dispose();
  }

  void _saveEducation() {
    if (!_formkey.currentState!.validate()) {
      return;
    }

    final institution = _institutionController.text.trim();
    final program = _programController.text.trim();
    final startYear = _startYearController.text.trim();
    final endYear = _isOngoing ? 'Masih berlangsung' : _endYearController.text.trim();

      showDialog<void>(
        context: context, 
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Ringkasan Edukasi'),
            content: SingleChildScrollView(
              child: Text(
                'Institusi: $institution\n'
                'Program: ${program.isEmpty ? "-" : program}\n'
                'Tahun Mulai: $startYear\n'
                'Tahun Selesai: $endYear',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                }, 
                child: const Text('OK'),),
            ],
          );
        },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Edukasi'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer:const LeftDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Informasi Pendidikan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                TextFormField(
                  controller: _institutionController,
                  maxLength: 255,
                  decoration: const InputDecoration(
                    labelText: 'Nama Institusi',
                    hintText: 'Universitas Indonesia',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama institusi tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _programController,
                  maxLength: 255,
                  decoration: const InputDecoration(
                    labelText: 'Program Studi (opsional)',
                    hintText: 'S1 Ilmu Komputer',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _startYearController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 4,
                  decoration: const InputDecoration(
                    labelText: 'Tahun Mulai',
                    hintText: '2025',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final year = int.tryParse(value?.trim() ?? "");

                    if(year == null || year <= 0 || value!.trim().length != 4) {
                      return 'Masukkan tahun mulai 4 digit yang valid!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12,),

                SwitchListTile(
                  title: const Text('Masih menempuh pendidikan'), 
                  subtitle: const Text('Aktifkan jika belum lulus'),
                  value: _isOngoing,
                  onChanged: (value) {
                    setState(() {
                    _isOngoing = value;
                    if (value) {
                      _endYearController.clear();
                    }
                  });
                  },
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _endYearController,
                  enabled: !_isOngoing,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 4,
                  decoration: const InputDecoration(
                    labelText: 'Tahun Selesai',
                    hintText: '2029',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if(_isOngoing) {
                      return null;
                    }

                    final endYear = int.tryParse(value?.trim() ?? '',);

                    if (endYear == null || endYear < 0 || value!.trim().length != 4) {
                      return 'Masukkan tahun selesai 4 digit';
                    }

                    final startYear = int.tryParse(_startYearController.text.trim(),);

                    if (startYear != null && endYear < startYear) {
                      return 'Tahun selesai tidak boleh lebih awal';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: _saveEducation,
                   icon: const Icon(Icons.save),
                   label: const Text('Simpan')),
              ],
            ),
          ),
        ))
    );
  }
}
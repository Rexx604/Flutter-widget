import 'package:flutter/material.dart';
import '../widget/profile_photo.dart';
import '../widget/profile_info.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const ProfileScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Variabel state yang bisa diubah (editable)
  String _name = 'Nama Mahasiswa';
  String _nim = '21.11.0000';
  String _programStudi = 'S1 Informatika';
  String _email = 'email@students.amikom.ac.id';
  String _lokasi = 'Yogyakarta, Indonesia';

  // Controller untuk menangkap input dari TextField saat dialog edit dibuka
  late TextEditingController _nameController;
  late TextEditingController _nimController;
  late TextEditingController _prodiController;
  late TextEditingController _emailController;
  late TextEditingController _lokasiController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _name);
    _nimController = TextEditingController(text: _nim);
    _prodiController = TextEditingController(text: _programStudi);
    _emailController = TextEditingController(text: _email);
    _lokasiController = TextEditingController(text: _lokasi);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _emailController.dispose();
    _lokasiController.dispose();
    super.dispose();
  }

  // Fungsi untuk menampilkan Dialog Form Edit Profil
  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profil Mahasiswa'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: _nimController,
                  decoration: const InputDecoration(labelText: 'NIM'),
                ),
                TextField(
                  controller: _prodiController,
                  decoration: const InputDecoration(labelText: 'Program Studi'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _lokasiController,
                  decoration: const InputDecoration(labelText: 'Lokasi'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // Menyimpan data baru ke state dan memperbarui UI
                setState(() {
                  _name = _nameController.text;
                  _nim = _nimController.text;
                  _programStudi = _prodiController.text;
                  _email = _emailController.text;
                  _lokasi = _lokasiController.text;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil berhasil diperbarui!')),
                );
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            tooltip: widget.isDarkMode ? 'Mode Terang' : 'Mode Gelap',
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const ProfilePhoto(radius: 60),
              const SizedBox(height: 24),
              
              // Menggunakan variabel state yang dapat berubah
              ProfileInfo(
                name: _name,
                nim: _nim,
                programStudi: _programStudi,
                email: _email,
                lokasi: _lokasi,
              ),
              
              const SizedBox(height: 24),
              
              // Tombol Aksi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _showEditDialog, // Membuka form edit saat diklik
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tautan profil dibagikan!')),
                      );
                    },
                    icon: const Icon(Icons.share),
                    label: const Text('Bagikan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
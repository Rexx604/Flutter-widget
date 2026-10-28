import 'package:flutter/material.dart';
import 'info_row.dart';
import 'social_media_row.dart'; // Import widget sosial media

class ProfileInfo extends StatelessWidget {
  final String name;
  final String nim;
  final String programStudi;
  final String email;
  final String lokasi;

  const ProfileInfo({
    super.key,
    required this.name,
    required this.nim,
    required this.programStudi,
    required this.email,
    required this.lokasi,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Teks Nama Mahasiswa
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        // Teks NIM
        Text(
          'NIM: $nim',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),

        // Social Media diletakkan persis di bawah Nama & NIM
        const SocialMediaRow(),

        const SizedBox(height: 16),
        const Divider(), // Garis pembatas
        const SizedBox(height: 16),

        // Detail Informasi
        InfoRow(icon: Icons.school, label: programStudi),
        InfoRow(icon: Icons.email, label: email),
        InfoRow(icon: Icons.location_on, label: lokasi),
      ],
    );
  }
}
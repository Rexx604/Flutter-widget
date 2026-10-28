import 'package:flutter/material.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.camera_alt), // Representasi Instagram
          color: Colors.pink,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Instagram diklik')),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.business), // Representasi LinkedIn
          color: Colors.blue,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('LinkedIn diklik')),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.code), // Representasi GitHub
          color: Colors.black,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('GitHub diklik')),
            );
          },
        ),
      ],
    );
  }
}
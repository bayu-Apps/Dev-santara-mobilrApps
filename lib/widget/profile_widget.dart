import 'package:flutter/material.dart';

class ProfilePanel extends StatelessWidget {
  const ProfilePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),

          // Avatar
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar.png'), // ganti path sesuai asetmu
          ),
          const SizedBox(height: 20),

          // Username
          Text(
            'Bayu Trihardian Syah',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),

          // Email
          Text(
            'bayurara555@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),

          const SizedBox(height: 30),

          
        ],
      ),
    );
  }
}

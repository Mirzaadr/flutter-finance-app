import 'package:flutter/material.dart';
import 'dart:ui';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("Tawfikul Emon", style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withValues(alpha: 0.7),
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text('Account'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.lock_outline),
                        title: Text('Privacy'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.notifications_outlined),
                        title: Text('Notifications'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.help_outline),
                        title: Text('Help & Support'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

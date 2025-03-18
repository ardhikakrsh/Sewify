import 'package:flutter/material.dart';
import 'package:pakeaja/service/auth/auth_service.dart';
import 'package:pakeaja/service/auth/welcome_page.dart';
import 'package:pakeaja/view/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void signOut() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              accountName: Text(
                'Mikhael Abi Saputra',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              accountEmail: Text('PakeAja@gmail.com'),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              iconColor: Colors.red,
              title: const Text('Logout'),
              onTap: () {
                signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const WelcomePage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

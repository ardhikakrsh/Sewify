import 'package:flutter/material.dart';
import 'package:pakeaja/service/auth/auth_service.dart';
import 'package:pakeaja/service/auth/welcome_page.dart';
import 'package:pakeaja/view/pages/cart_page.dart';
import 'package:pakeaja/view/pages/history_page.dart';
import 'package:pakeaja/view/pages/profile_page.dart';
import 'package:pakeaja/view/pages/settings_page.dart';

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
                backgroundImage: AssetImage('assets/img/slide3.jpg'),
              ),
              accountName: Text(
                'Mikhael Abi Saputra',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              accountEmail: Text('PakeAja@gmail.com'),
            ),

            // profile
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProfilePage();
                    },
                  ),
                );
              },
            ),

            // My Cart
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.green),
              title: const Text('My Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CartPage();
                    },
                  ),
                );
              },
            ),

            // My Orders
            ListTile(
              leading: const Icon(Icons.history, color: Colors.orange),
              title: const Text('History'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HistoryPage();
                    },
                  ),
                );
              },
            ),

            // settings
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

            const Spacer(),
            // logout
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

            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '© 2025 PakeAja. By Ardhika.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

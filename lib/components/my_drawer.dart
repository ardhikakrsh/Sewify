import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sewify/service/auth/auth_service.dart';
import 'package:sewify/service/auth/welcome_page.dart';
import 'package:sewify/view/pages/cart_page.dart';
import 'package:sewify/view/pages/history_page.dart';
import 'package:sewify/view/pages/settings_page.dart';

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
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[800]),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/img/slide3.jpg'),
              ),
              accountName: const Text(
                'Ardhika Krishna',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              accountEmail: const Text('itsyourboydhk@gmail.com'),
            ),

            // My Cart
            ListTile(
              leading:
                  const Icon(Icons.shopping_cart, color: Colors.blueAccent),
              title: const Text('My Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const CartPage(),
                  ),
                );
              },
            ),

            // My Orders
            ListTile(
              leading: const Icon(Icons.history, color: Colors.green),
              title: const Text('History'),
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const HistoryPage(),
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
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const SettingsPage(),
                  ),
                );
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
                  PageTransition(
                    type: PageTransitionType.topToBottomJoined,
                    childCurrent: const Drawer(),
                    child: const WelcomePage(),
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
                    '© 2025 sewify. By Ardhika.',
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

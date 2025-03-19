import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pakeaja/components/my_drawer.dart';
import 'package:pakeaja/data/notifiers.dart';
import 'package:pakeaja/view/pages/cart_page.dart';
import 'package:pakeaja/view/pages/collection_page.dart';
import 'package:pakeaja/view/pages/home_page.dart';
import 'package:pakeaja/view/pages/profile_page.dart';
import 'package:pakeaja/view/widgets/navbar_widget.dart';

List<Widget> pages = [
  const HomePage(),
  const CollectionPage(),
  const ProfilePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PakeAja'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: const CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}

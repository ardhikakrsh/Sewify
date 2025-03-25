import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sewify/components/my_list.dart';
import 'package:sewify/service/database/firestore.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getGoodsStream(),
        builder: (context, snapshot) {
          // if the connection is in waiting state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }

          // if there is no data
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Lottie.asset('assets/lotties/empty1.json'));
          }

          // if there is data
          List goodsList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: goodsList.length,
            itemBuilder: (context, index) {
              // get each individual doc
              DocumentSnapshot document = goodsList[index];
              String docID = document.id;

              // get the goods from each doc
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String name = data['name'];
              String price = data['price'];
              String description = data['description'];

              // display as a list tile
              return SingleChildScrollView(
                child: MyList(
                  name: name,
                  price: price,
                  description: description,
                  docID: docID,
                ),
              );
            },
          );
        },
      ),
    );
  }

  void openNoteBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text(
          'Add Goods',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: const Icon(Icons.text_fields),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                    prefixIcon: const Icon(Icons.price_change),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    prefixIcon: const Icon(Icons.description),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              fixedSize: const Size(95, 40),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              fixedSize: const Size(95, 40),
            ),
            onPressed: () {
              // jika kosong semua
              if (nameController.text.isEmpty ||
                  priceController.text.isEmpty ||
                  descriptionController.text.isEmpty) {
                Navigator.pop(context);
                return;
              }
              // jika price bukan angka
              else if (double.tryParse(priceController.text) == null) {
                // show snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Price must be a number'),
                  ),
                );
                return;
              }
              // tambahkan goods
              else {
                firestoreService.addGoods(
                  nameController.text,
                  priceController.text,
                  descriptionController.text,
                );
                nameController.clear();
                priceController.clear();
                descriptionController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    ); // Add goods to the collection
  }
}

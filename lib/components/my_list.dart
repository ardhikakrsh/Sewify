import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sewify/service/database/firestore.dart';

class MyList extends StatefulWidget {
  final String name;
  final String price;
  final String description;
  final String docID;

  const MyList({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.docID,
  });

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      child: Card(
        elevation: 3,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Slidable(
          key: Key(widget.docID),
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              // edit button
              SlidableAction(
                onPressed: (context) => editGoods(),
                icon: Icons.edit,
                label: 'Edit',
                backgroundColor: Colors.green,
              ),

              // view button
              SlidableAction(
                onPressed: (context) => viewGoods(),
                icon: Icons.visibility,
                label: 'View',
                backgroundColor: Colors.blue,
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              // delete button
              SlidableAction(
                onPressed: (context) =>
                    firestoreService.deleteGoods(widget.docID),
                icon: Icons.delete,
                label: 'Delete',
                backgroundColor: Colors.red,
              ),
            ],
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            // display the name
            title: Text(
              widget.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            // display the price
            subtitle: Text('Price: ${widget.price}',
                style: const TextStyle(fontSize: 14)),
          ),
        ),
      ),
    );
  }

  void viewGoods() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Description'),
        content: Text(widget.description),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
            label: const Text('Close'),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  void editGoods() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nameController =
            TextEditingController(text: widget.name);
        final TextEditingController priceController =
            TextEditingController(text: widget.price);
        final TextEditingController descriptionController =
            TextEditingController(text: widget.description);

        // edit dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Edit Goods',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
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
                  prefixIcon: const Icon(Icons.attach_money),
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
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white),
              onPressed: () {
                firestoreService.updateGoods(
                  nameController.text,
                  priceController.text,
                  descriptionController.text,
                  widget.docID,
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

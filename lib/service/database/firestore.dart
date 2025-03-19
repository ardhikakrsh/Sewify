import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of goods
  final CollectionReference goods =
      FirebaseFirestore.instance.collection('goods');

  // create: add new goods
  Future<void> addGoods(String name, String price, String description) {
    return goods.add(
      {
        'createdAt': Timestamp.now(),
        'name': name,
        'price': price,
        'description': description,
      },
    );
  }

  // read: get goods from database
  Stream<QuerySnapshot> getGoodsStream() {
    final goodsStream =
        goods.orderBy('createdAt', descending: false).snapshots();

    return goodsStream;
  }

  // update: update goods given a doc id
  Future<void> updateGoods(
      String name, String price, String description, String docID) {
    return goods.doc(docID).update(
      {
        'name': name,
        'price': price,
        'description': description,
      },
    );
  }

  // delete: delete goods given a doc id
  Future<void> deleteGoods(String docID) {
    return goods.doc(docID).delete();
  }
}

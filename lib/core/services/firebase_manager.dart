import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:recogenie_task/data/model/product_model.dart';

@singleton
class FirebaseManager {
  Future<UserCredential> registerService(String email, String password) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> loginService(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    return await FirebaseFirestore.instance.collection('menu').get();
  }

  Future<void> addToCart(ProductModel product) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('User not logged in');
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('cart')
        .doc(product.id)
        .set(product.toJson());
  }

  Future<List<ProductModel>> getCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception('User not logged in');

    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('cart')
        .get();

    return snapshot.docs.map((doc) {
      return ProductModel.fromJson(doc.data(), doc.id);
    }).toList();
  }

  Future<void> removeFromCart(String productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('cart')
        .doc(productId)
        .delete();
  }
}

import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:recogenie_task/core/result.dart';
import 'package:recogenie_task/core/services/firebase_manager.dart';
import 'package:recogenie_task/data/data_source_contract/get_products_datasource.dart';
import 'package:recogenie_task/data/model/product_model.dart';

@Injectable(as: GetProductsDatasource)
class GetProductsDatasourceImpl implements GetProductsDatasource {
  @factoryMethod
  GetProductsDatasourceImpl(this._firebaseManager);
  final FirebaseManager _firebaseManager;
  @override
  Future<Result<List<ProductModel>>> getProducts() async {
    try {
      final snapshot = await _firebaseManager.getProducts();
      log(snapshot.docs.toString());
      final result = snapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data(), doc.id);
      }).toList();
      return Success<List<ProductModel>>(result);
    } catch (e) {
      return Error(Exception('Failed to fetch products: $e'));
    }
  }
}

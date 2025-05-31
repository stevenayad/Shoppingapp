import 'package:either_dart/either.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/colthe_model.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/core/error/Failure.dart';

abstract class HomeRepo {
  Future<Either<Failure , List<Product>>> fetchproductbeauty();
  Future<Either<Failure , List<Product>>> fetchproductfragrances();
  Future<Either<Failure , List<Product>>> fetchproductfurniture();
  Future<Either<Failure , List<Product>>> fetchproductgroceries();
  
}
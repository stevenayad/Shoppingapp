import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:shopp/Homepage/data/Models/colthe_model/product.dart';
import 'package:shopp/Homepage/data/Repo/home_repo.dart';
import 'package:shopp/core/Api_server.dart';
import 'package:shopp/core/error/Failure.dart';

class HomeRepoImpelemtation implements HomeRepo {
  final ApiServer apiServer;

  HomeRepoImpelemtation({required this.apiServer});

  
  Future<Either<Failure, List<Product>>> fetchProductsByCategory(String category) async {
    try {
      var data = await apiServer.get(endpoint: ''); 
      List<Product> filteredProducts = [];
      
  
      for (var product in data['products']) {
        if (product['category'] == category) {
          filteredProducts.add(Product.fromJson(product));
        }
      }
      return Right(filteredProducts);
    } on Exception catch (ex) {
      if (ex is DioError) {
        return Left(servivefailure.fromDioError(ex));
      }
      return Left(servivefailure(ex.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> fetchproductbeauty() async {
    return await fetchProductsByCategory('beauty');
  }

  @override
  Future<Either<Failure, List<Product>>> fetchproductfragrances() async {
    return await fetchProductsByCategory('fragrances');
  }

  @override
  Future<Either<Failure, List<Product>>> fetchproductfurniture() async {
    return await fetchProductsByCategory('furniture');
  }

  @override
  Future<Either<Failure, List<Product>>> fetchproductgroceries() async {
    return await fetchProductsByCategory('groceries');
  }
}

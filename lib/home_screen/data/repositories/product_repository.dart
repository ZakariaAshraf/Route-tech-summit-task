
import 'package:dartz/dartz.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_remote_data_source.dart';
import '../../domain/repositories/product_repository.dart';
import '../../failures.dart';
import '../data_sources/product_remote_datasource.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImp({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, ResponseProductEntity>> getAllProduct() {
    return productRemoteDataSource.getAllProduct();
  }
}

ProductRepository injectProductRepository() {
  return ProductRepositoryImp(
    productRemoteDataSource: injectProductRemoteDataSource(),
  );
}
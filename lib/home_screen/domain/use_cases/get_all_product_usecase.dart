import 'package:dartz/dartz.dart';

import '../../data/repositories/product_repository.dart';
import '../../failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';




class GetAllProductUseCase {
  final ProductRepository productRepository;

  GetAllProductUseCase({required this.productRepository});
  Future<Either<Failure, ResponseProductEntity>> invoke() async {
    return productRepository.getAllProduct();
  }
}

GetAllProductUseCase injectGetAllProductUseCase() {
  return GetAllProductUseCase(productRepository: injectProductRepository());
}
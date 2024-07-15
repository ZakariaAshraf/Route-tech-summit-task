import 'package:dartz/dartz.dart';

import '../../failures.dart';
import '../entities/product_entity.dart';



abstract class ProductRemoteDataSource {
  Future<Either<Failure, ResponseProductEntity>> getAllProduct();
}
import 'package:dartz/dartz.dart';

import '../../failures.dart';
import '../entities/product_entity.dart';


abstract class ProductRepository {
  Future<Either<Failure, ResponseProductEntity>> getAllProduct();
}
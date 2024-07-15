import 'package:dartz/dartz.dart';


import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_remote_data_source.dart';
import '../../failures.dart';
import '../../presentation/manager/shared/newtwork_layer/api_manager.dart';

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  ApiManager apiManager;

  ProductRemoteDataSourceImp({required this.apiManager});
  @override
  Future<Either<Failure, ResponseProductEntity>> getAllProduct() async {
    var either = await apiManager.getAllProduct();
    return either.fold(
      (l) => Left(
        Failure(errorMessage: l.errorMessage),
      ),
      (response) => Right(
        response,
      ),
    );
  }
}

ProductRemoteDataSource injectProductRemoteDataSource() {
  return ProductRemoteDataSourceImp(apiManager: ApiManager.instance);
}
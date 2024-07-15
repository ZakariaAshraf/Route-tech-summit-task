import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:route_jop_fair_summit_task/home_screen/const/api_constants.dart';

import '../../../../data/models/prodect_response.dart';
import '../../../../failures.dart';



class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager get instance {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failure, ResponseProductDto>> getAllProduct() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(Constants.apiBaseUrl,Constants. apiGetProducts);
      var response = await http.get(url);

      var getAllProductResponse =
          ResponseProductDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(getAllProductResponse);
      } else {
        return Left(
          ServerFailure(
              errorMessage: 'Error in response data please try again'),
        );
      }
    } else {
      return Left(
        ServerFailure(errorMessage: 'No Internet Connection please try again'),
      );
    }
  }
}
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/home/data/model/home_model.dart';
import 'api_constants.dart';

part 'api_service_home.g.dart';

@RestApi(baseUrl: ApiConstants.homeApiBaseUrl)
abstract class ApiServiceHome {
  factory ApiServiceHome(Dio dio, {String baseUrl}) = _ApiServiceHome;

  @GET(ApiConstants.home)
  Future<Home> home();
}

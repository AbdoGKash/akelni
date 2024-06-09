import '../../../../core/networking/api_service_home.dart';
import '../model/home_model.dart';

class HomeRepo {
  final ApiServiceHome _apiServiceHome;

  HomeRepo(this._apiServiceHome);

  Future<Home> home() async {
    return await _apiServiceHome.home();
  }
}

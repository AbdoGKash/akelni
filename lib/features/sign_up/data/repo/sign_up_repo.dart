import 'package:flutter_application_1/core/networking/api_error_handler.dart';
import 'package:flutter_application_1/core/networking/api_result.dart';
import 'package:flutter_application_1/core/networking/api_service.dart';
import 'package:flutter_application_1/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:flutter_application_1/features/sign_up/data/model/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;
  SignUpRepo(this._apiService);
  Future<ApiResult<SignupResponse>> signUp(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

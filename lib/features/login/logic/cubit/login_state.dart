// import 'package:flutter_application_1/features/login/data/model/login_response.dart';

// abstract class LoginState {}

// class Initial extends LoginState {}

// class Loading extends LoginState {}

// class Success extends LoginState {
//   final LoginResponse loginResponse;
//   Success(this.loginResponse);
// }

// class Error extends LoginState {
//   final String error;
//   Error(this.error);
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.inital() = _Inital; // private
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error({required String error}) = Error;
}

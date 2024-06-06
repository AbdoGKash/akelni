import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/login/data/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login_request_body.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.inital());

  void emitLoginState(LoginRequestBody requestBody) async {
    emit(const Loading());
    final response = await _loginRepo.login(requestBody);
    response.when(
      success: (loginResonse) {
        emit(LoginState.success(loginResonse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      BlocProvider.of<LoginCubit>(context).emitLoginState(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text));
    }
  }
}

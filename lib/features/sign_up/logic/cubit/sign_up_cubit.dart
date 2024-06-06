import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/sign_up_request_body.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emaillController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  void emitSignUp(SignupRequestBody signupRequestBody) async {
    emit(const SignUpState.loading());
    final response = await _signUpRepo.signUp(signupRequestBody);
    response.when(success: (signupResponse) {
      emit(SignUpState.success(signupResponse));
    }, failure: (error) {
      emit(SignUpState.error(error: error.apiErrorModel.message ?? ""));
    });
  }

  void validateThenDoSignUp() {
    if (formKey.currentState!.validate()) {
      emitSignUp(SignupRequestBody(
          email: emaillController.text,
          name: nameController.text,
          phone: phoneNumberController.text,
          password: passwordController.text,
          passwordConfirmation: passwordConfirmationController.text,
          gender: 0));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/app_strings.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            hintText: AppStrings.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterVaildName;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: context.read<SignUpCubit>().phoneNumberController,
            hintText: AppStrings.phoneNumber,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterVaildPhone;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emaillController,
            hintText: AppStrings.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterVaildEmail;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordObscureText = !isPasswordObscureText;
                  });
                },
                child: Icon(isPasswordObscureText
                    ? Icons.visibility_off
                    : Icons.visibility)),
            controller: context.read<SignUpCubit>().passwordController,
            hintText: AppStrings.password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterVaildPassword;
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordConfirmationObscureText =
                        !isPasswordConfirmationObscureText;
                  });
                },
                child: Icon(isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility)),
            controller:
                context.read<SignUpCubit>().passwordConfirmationController,
            hintText: AppStrings.passwordConfirmation,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.pleaseEnterVaildPassword;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a vaild name";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: context.read<SignUpCubit>().phoneNumberController,
            hintText: 'Phone number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a vaild phone number";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: context.read<SignUpCubit>().emaillController,
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a vaild email";
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
            hintText: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a vaild password";
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
            hintText: 'Password confirmation',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a vaild password";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

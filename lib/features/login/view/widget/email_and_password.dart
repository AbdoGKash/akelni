// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/app_strings.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: AppStrings.email.tr(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterEmailVaild.tr(context);
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: AppStrings.password.tr(context),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterPasswordVaild.tr(context);
              }
              return null;
            },
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                )),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

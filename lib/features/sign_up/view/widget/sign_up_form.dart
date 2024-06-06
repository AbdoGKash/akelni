import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppTextFormField(
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

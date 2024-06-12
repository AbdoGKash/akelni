import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/text_styel.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/login_cubit.dart';
import 'widget/bloc_listner.dart';
import 'widget/dont_have_account_text.dart';
import 'widget/email_and_password.dart';
import 'widget/login_google_facebook.dart';
import 'widget/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.wlcomeBack,
                  style: TextStyles.font24primaryBold,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppStrings.welcomeDescription,
                  style: TextStyles.font14Gray200,
                ),
                const SizedBox(
                  height: 36,
                ),
                const EmailAndPassword(),
                // Align(
                //   alignment: AlignmentDirectional.centerEnd,
                //   child: Text(
                //     'Forgot Password ?',
                //     style: TextStyles.font13primary300,
                //   ),
                // ),
                const SizedBox(
                  height: 50,
                ),
                AppTextButton(
                  buttonText: AppStrings.login,
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    context.read<LoginCubit>().validateThenDoLogin(context);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                const TermsAndConditionsText(),
                const SizedBox(
                  height: 30,
                ),
                const DontHaveAccountText(),
                const SizedBox(
                  height: 30,
                ),
                const LoginGoogleFacebook(),
                const LoginBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

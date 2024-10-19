import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/components.dart';
import 'package:ibrahim_project/features/register/presentation/views/register_view.dart';
import '../../../../../core/custom_widgets/custom_text_field.dart';
import 'custom_login_button.dart';


class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
   final formKey = GlobalKey<FormState>();
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: emailController,
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email',
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: passwordController,
                    prefixIcon: Icons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    label: 'Password',
                  ),
                  const SizedBox(height: 40),
                  CustomLoginButton(emailController, passwordController),
                  const SizedBox(height: 10),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, const RegisterView());
                            },
                            child: const Text('Register',
                              style: TextStyle(color: Colors.blue),)),
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}

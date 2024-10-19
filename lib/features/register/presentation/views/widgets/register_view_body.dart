import 'package:flutter/material.dart';
import '../../../../../core/custom_widgets/custom_text_field.dart';
import 'custom_register_button.dart';


class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});
  static final formKey = GlobalKey<FormState>();

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Form(
              key: RegisterViewBody.formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: nameController,
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.name,
                    label: 'Name',
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: phoneController,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    label: 'Phone',
                  ),
                  const SizedBox(height: 20),
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
                  CustomRegisterButton(
                    nameController,
                    phoneController,
                    emailController,
                    passwordController,
                  ),
                ],
              ),
            )
        )
    );
  }
}
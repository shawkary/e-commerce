import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/custom_widgets/custom_button.dart';
import 'package:ibrahim_project/core/custom_widgets/custom_text_field.dart';
import 'package:ibrahim_project/core/utiles/cache_helper.dart';
import 'package:ibrahim_project/core/utiles/components.dart';
import 'package:ibrahim_project/features/home/presentation/manager/shop_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/shop_cubit/states.dart';
import 'package:ibrahim_project/features/login/presentation/views/login_view.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/errors/custom_error_widget.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (BuildContext context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        if (cubit.loginModel != null) {
        nameController.text = cubit.loginModel!.data!.name!;
        emailController.text = cubit.loginModel!.data!.email!;
        phoneController.text = cubit.loginModel!.data!.phone!;
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                   CustomTextFormField(
                     controller: nameController,
                    hintText: cubit.loginModel!.data!.name!,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: cubit.loginModel!.data!.email!,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: phoneController,
                    hintText: cubit.loginModel!.data!.phone!,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: ()
                    {
                      cubit.updateProfile(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                      ).then((value){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                          cubit.loginModel!.message!,
                        )));
                      });
                    },
                    text: 'Update',
                  ),
                  const SizedBox(height: 100),
                  CustomButton(
                    onPressed: ()
                    {
                      CacheHelper.deleteData(key: 'token').then((value){
                        token = CacheHelper.getData(key: 'token');
                        navigateAndFinish(context, const LoginView());
                      });
                    },
                    text: 'Logout',
                    color: Colors.redAccent,
                  )
                ],
              ),
            ),
          );
        }else if(cubit.errProfile != null){
          return Center(child: CustomErrorWidget(errMessage: cubit.errProfile!));
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

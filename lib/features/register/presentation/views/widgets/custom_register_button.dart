import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/custom_widgets/custom_button.dart';
import 'package:ibrahim_project/core/utiles/cache_helper.dart';
import 'package:ibrahim_project/core/utiles/components.dart';
import 'package:ibrahim_project/features/home/presentation/views/home_view.dart';
import 'package:ibrahim_project/features/register/presentation/manager/register_cubit/states.dart';
import '../../../../../constants.dart';
import '../../../../../core/errors/custom_error_widget.dart';
import '../../../../../core/utiles/dio_helper.dart';
import '../../../../home/presentation/manager/shop_cubit/cubit.dart';
import '../../manager/register_cubit/cubit.dart';


class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton(
      this.nameController,
      this.phoneController,
      this.emailController,
      this.passwordController,
      {super.key,
        this.color = Colors.blue,
      });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(DioHelper(Dio())),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if(state is SuccessRegisterState){
              if(state.loginModel.status!){
                toastMsg(msg: state.loginModel.message!);
                CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token).then((value){
                  token = CacheHelper.getData(key: 'token');
                  ShopCubit cubit = ShopCubit.get(context);
                  cubit.fetchProductData();
                  cubit.fetchCategoryData();
                  cubit.fetchFavoritesData();
                  cubit.fetchProfileData();
                });
                  navigateAndFinish(context, const HomeView());
              }else{
                toastMsg(msg: state.loginModel.message!, backgroundColor: Colors.red);
              }
            }
          },
          builder: (BuildContext context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            if (state is SuccessRegisterState) {
              return CustomButton(
                onPressed: ()
                {
                  cubit.postRegister(
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                text: 'Login',
              );
            }else if(state is ErrorRegisterState){
              return CustomErrorWidget(errMessage: state.errMessage);
            }else if(state is LoadingRegisterState){
              return const Center(child: CircularProgressIndicator());
            }else{
              return CustomButton(
                onPressed: ()
                {
                  cubit.postRegister(
                    name: nameController.text,
                    phone: phoneController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                text: 'Register',
              );
            }
          },
        )
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/dio_helper.dart';
import 'package:ibrahim_project/features/login/data/model/LoginModel.dart';
import 'package:ibrahim_project/features/login/presentation/manager/login_cubit/states.dart';


class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(this.dio): super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);

  final DioHelper dio;


  Future<void> postLogin({
    required String email,
    required String password,
})async{
    emit(LoadingLoginState());
    dio.postData(
        endPoint: 'login',
        lang: 'en',
        data: {
          'email': email,
          'password': password,
        },
    ).then((value){
      LoginModel loginModel;
      loginModel = LoginModel.fromJson(value.data);
      emit(SuccessLoginState(loginModel));
    }).catchError((e){
      emit(ErrorLoginState(e.toString()));
    });

  }
}
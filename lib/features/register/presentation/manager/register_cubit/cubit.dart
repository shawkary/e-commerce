import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/dio_helper.dart';
import 'package:ibrahim_project/features/login/data/model/LoginModel.dart';
import 'package:ibrahim_project/features/register/presentation/manager/register_cubit/states.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit(this.dio): super(InitialRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final DioHelper dio;


  Future<void> postRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  })async{
    emit(LoadingRegisterState());
    dio.postData(
      endPoint: 'register',
      lang: 'en',
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((value){
      LoginModel loginModel;
      loginModel = LoginModel.fromJson(value.data);
      emit(SuccessRegisterState(loginModel));
    }).catchError((e){
      emit(ErrorRegisterState(e.toString()));
    });

  }
}
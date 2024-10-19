import 'package:ibrahim_project/features/login/data/model/LoginModel.dart';

abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}
class SuccessLoginState extends LoginStates {
  final LoginModel loginModel;
  SuccessLoginState(this.loginModel);
}
class ErrorLoginState extends LoginStates {
  final String errMessage;
  ErrorLoginState(this.errMessage);
}

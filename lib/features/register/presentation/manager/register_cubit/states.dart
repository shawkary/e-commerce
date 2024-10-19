import 'package:ibrahim_project/features/login/data/model/LoginModel.dart';

abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class LoadingRegisterState extends RegisterStates {}
class SuccessRegisterState extends RegisterStates {
  final LoginModel loginModel;
  SuccessRegisterState(this.loginModel);
}
class ErrorRegisterState extends RegisterStates {
  final String errMessage;
  ErrorRegisterState(this.errMessage);
}

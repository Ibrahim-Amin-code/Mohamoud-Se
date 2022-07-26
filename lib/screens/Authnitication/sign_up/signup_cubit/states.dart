abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}

class FirebaseRegisterLoadingState extends RegisterStates{}
class FirebaseRegisterSuccessState extends RegisterStates{}
 class FirebaseRegisterErrorState extends RegisterStates{
  final String error;
  FirebaseRegisterErrorState(this.error);
}



abstract class ForgetPasswordStates{}

class ForgetPasswordInitialState extends ForgetPasswordStates{}
class ForgetPasswordLoadingState extends ForgetPasswordStates{}
class ForgetPasswordSuccessState extends ForgetPasswordStates{}
class ForgetPasswordErrorState extends ForgetPasswordStates{
  final String error;
  ForgetPasswordErrorState(this.error);
}
class ResetPasswordLoadingState extends ForgetPasswordStates{}
class ResetPasswordSuccessState extends ForgetPasswordStates{}
class ResetPasswordErrorState extends ForgetPasswordStates{
  final String error;
  ResetPasswordErrorState(this.error);
}
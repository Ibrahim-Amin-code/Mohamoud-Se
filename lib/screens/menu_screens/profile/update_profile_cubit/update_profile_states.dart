abstract class UpdateProfileStates{}

class UpdateProfiledInitialState extends UpdateProfileStates{}
class UpdateProfiledLoadingState extends UpdateProfileStates{}
class UpdateProfiledSuccessState extends UpdateProfileStates{}
class UpdateProfiledErrorState extends UpdateProfileStates{
  final String error;
  UpdateProfiledErrorState(this.error);
}

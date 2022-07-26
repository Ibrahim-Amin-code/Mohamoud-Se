abstract class GetProfileStates{}

class GetProfiledInitialState extends GetProfileStates{}
class GetProfiledLoadingState extends GetProfileStates{}
class GetProfiledSuccessState extends GetProfileStates{}
class GetProfiledErrorState extends GetProfileStates{
  final String error;
  GetProfiledErrorState(this.error);
}

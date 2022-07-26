import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
import 'package:nib_app/screens/menu_screens/profile/update_profile_cubit/update_profile_states.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfiledInitialState());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  var data;

  void updateProfile({
    required String name,
    required String mobile,
  }) async {
    emit(UpdateProfiledLoadingState());
    final String token = await CacheHelper.getData(key: 'token');
    DioHelper.updateProfileData(
        url: UpdateProfile,
        token: 'Bearer $token',
        data: {
          'name': name,
          'mobile': mobile,
        }).then((value) {
      data = value.data;
      print(data);
      emit(UpdateProfiledSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfiledErrorState(error.toString()));
    });
  }
}

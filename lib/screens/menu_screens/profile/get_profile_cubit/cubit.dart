import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/models/get_products_model.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
import 'package:nib_app/screens/menu_screens/profile/get_profile_cubit/states.dart';

class GetProfileCubit extends Cubit<GetProfileStates> {
  GetProfileCubit() : super(GetProfiledInitialState());

  static GetProfileCubit get(context) => BlocProvider.of(context);

  var data;

  void getProfile() async {
    emit(GetProfiledLoadingState());
    final String token = await CacheHelper.getData(key: 'token');
    DioHelper.getData(
      url: GetProfile,
      token: 'Bearer $token',
    ).then((value) {
      data = value.data;
      print(data);
      print(data['msg']);
      print('----------------------------------------------------------------' +
          token);
      emit(GetProfiledSuccessState());
    }).catchError((error) {
      emit(GetProfiledErrorState(error.toString()));
      print(token.toString());
      print(error.toString());
    });
  }
}

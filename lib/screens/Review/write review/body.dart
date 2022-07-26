import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/Authnitication/sign_in/login_cubit/cubit.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/components/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:nib_app/screens/menu_screens/profile/get_profile_cubit/cubit.dart';

// ignore: use_key_in_widget_constructors
class WriteRviewBody extends StatefulWidget {
  final String id;

  const WriteRviewBody({Key? key, required this.id}) : super(key: key);
  @override
  _WriteRviewBodyState createState() => _WriteRviewBodyState();
}

class _WriteRviewBodyState extends State<WriteRviewBody> {
  TextEditingController message = TextEditingController();
  double rate = 0.0;

  String userName = '';

  getUserName() async {
    final String name = await CacheHelper.getData(key: 'username');
    setState(() {
      userName = name;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      children: [
        Center(
          child: Text(
            LocaleKeys.Trip.tr(),
            style: headingStyle.copyWith(
                color: HexColor("#4CB8BA"),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        spaceH(15),
        Center(
          child: Text(
            LocaleKeys.Rate.tr(),
            style: headingStyle.copyWith(
                color: HexColor("#515C6F"),
                fontSize: 16,
                height: 1.8,
                fontWeight: FontWeight.w400),
          ),
        ),
        spaceH(30),
        Center(
          child: RatingBar.builder(
            initialRating: rate,
            minRating: 1,
            itemSize: 30,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            unratedColor: HexColor("#C9C9C9"),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: HexColor("##FFBE03"),
              size: 10,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                rate = rating;
              });
            },
          ),
        ),
        spaceH(15),
        Center(
          child: Text(
            LocaleKeys.Press.tr(),
            style: headingStyle.copyWith(
                color: HexColor("#C9C9C9"),
                fontSize: 21,
                fontWeight: FontWeight.w400),
          ),
        ),
        spaceH(15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: HexColor("#333333")),
            ),
            spaceW(15),
            Center(
              child: Text(
                //      CacheHelper.saveData(value: loginModel.data!.name ,key: 'username');
                userName,
                style: headingStyle.copyWith(
                    color: HexColor("#4CB8BA"),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        spaceH(30),
        Text(
          LocaleKeys.Write_Review.tr(),
          style: headingStyle.copyWith(
              color: HexColor("#333333"),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        spaceH(15),
        multilineTextField(
            title: "",
            controller: message,
            type: TextInputType.text,
            secure: false),
        spaceH(40),
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DefaultButton(
                  press: () {
                    DateTime now = DateTime.now();
                    String formattedDate =
                        DateFormat('yyyy-MM-dd – kk:mm').format(now);
                    HomeCubit.get(context).addReview(
                        productId: widget.id,
                        comment: message.text.toString(),
                        rate: rate,
                        date: formattedDate);
                  },
                  text: LocaleKeys.Done.tr())),
        ),
        spaceH(15),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'body.dart';
import 'package:sizer/sizer.dart';

class AuthniticationScreen extends StatefulWidget {
  static String token = '';
  static LocationData? userLocation;

  const AuthniticationScreen({Key? key}) : super(key: key);

  @override
  _AuthniticationScreenState createState() => _AuthniticationScreenState();
}

class _AuthniticationScreenState extends State<AuthniticationScreen> {
  bool isLogin = false;

  getScreen() async {
    // setState(() {
    AuthniticationScreen.token = await CacheHelper.getData(key: 'token') ?? "";
    // });
    if (AuthniticationScreen.token != "") {
      setState(() {
        print(AuthniticationScreen.token);
        isLogin = true;
      });
    } else {
      setState(() {
        print(AuthniticationScreen.token);
        isLogin = false;
      });
    }
  }

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  Future<void> _getUserLocation() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final _locationData = await location.getLocation();
    setState(() {
      AuthniticationScreen.userLocation = _locationData;
      print(AuthniticationScreen.userLocation!.latitude.toString());
      print(AuthniticationScreen.userLocation!.longitude.toString());
    });
  }

  @override
  void initState() {
    this.getScreen();
    _getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      print(AuthniticationScreen.token);
      return LayoutScreen(index: 2);
    } else {
      print(AuthniticationScreen.token);
      return Authniticate();
    }
  }
}

class Authniticate extends StatelessWidget {
  const Authniticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: HexColor('#AA1050'),
        // gradient:
        //     LinearGradient(colors: [HexColor("#40A2A6"), HexColor("#4CB8BA")]),
      ),
      // ignore: prefer_const_constructors
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const AuthniticationBody(),
      ),
    );
  }
}

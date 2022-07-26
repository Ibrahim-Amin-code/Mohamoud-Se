import 'dart:convert';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';

import '../../generated/locale_keys.dart';
import '../../network/cache/cache_helper.dart';
import '../components/constants.dart';
import '../home/home_cubit/home_cubit.dart';
import '../menu_screens/profile/profile_component/profile_component.dart';
import '../see_all/sell_all_screen.dart';

class CategorySearch extends SearchDelegate {
  CategorySearch()
      : super(
            searchFieldLabel: LocaleKeys.Search.tr(),
            searchFieldStyle: TextStyle(fontSize: 18, fontFamily: 'Cairo'));

  List searchCategory = [];

  getSearchCategory({required String keyword}) async {
    try {
      String lang = await CacheHelper.getData(key: 'lang') ?? 'ar';
      var response = await http.get(Uri.parse(
          "http://beautiheath.com/sub/eshop/api/buyers/categotries?lang=$lang&categoryTitle=$keyword"));
      var data;
      data = jsonDecode(response.body);
      searchCategory.clear();
      searchCategory.addAll(data['data']);
      return searchCategory;
    } catch (error) {
      print("erooooooooooooor" + error.toString());
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      // Switch(value: value, onChanged: onChanged),
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
            future: getSearchCategory(keyword: query.toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount: searchCategory.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            HomeCubit.get(context).getProducts(
                                id: searchCategory[index]['id'].toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeeAllScreen()));
                          },
                          child: buildCategoriesSearch(
                              pathImage: searchCategory[index]['icon'],
                              context: context,
                              title: searchCategory[index]['title']),
                        ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
  }

  Widget buildCategoriesSearch(
          {required String pathImage, required String title, context}) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        // height: 115,
        child: Row(
          children: [
            Container(
                height: 10.h,
                width: 18.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.red
                ),
                child: customCachedNetworkImage(
                    url: pathImage, context: context, fit: BoxFit.contain)),
            SizedBox(
              width: 30,
            ),
            Text(
              title,
              style: TextStyle(
                  color: HexColor('515C6F'),
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
            future: getSearchCategory(keyword: query.toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount: searchCategory.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            HomeCubit.get(context).getProducts(
                                id: searchCategory[index]['id'].toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SeeAllScreen()));
                          },
                          child: buildCategoriesSearch(
                              pathImage: searchCategory[index]['icon'],
                              context: context,
                              title: searchCategory[index]['title']),
                        ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
  }
}

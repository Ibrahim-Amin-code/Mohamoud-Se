import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/models/search_model.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nib_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../network/cache/cache_helper.dart';
import 'components/constants.dart';

class ProductsSearch extends SearchDelegate {
  ProductsSearch()
      : super(
            searchFieldLabel: 'Search ',
            searchFieldStyle: TextStyle(fontSize: 18, fontFamily: 'Cairo'));

  getSearchProduct({required String keyword}) async {
    try {
      String lang = await CacheHelper.getData(key: 'lang') ?? 'ar';
      var response = await http.get(Uri.parse(
          "http://beautiheath.com/sub/eshop/api/buyers/products/search?name=$keyword&lang=$lang"));
      searchModel = SearchModel.fromJson(json.decode(response.body));
      return searchModel;
    } catch (error) {
      print("erooooooooooooor" + error.toString());
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
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

  SearchModel searchModel = SearchModel();

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
            future: getSearchProduct(keyword: query.toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount: snapshot.data.data!.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                        details: snapshot.data.data![index],
                                      ))),
                          child: buildSearchProduct(
                            context: context,
                            price: (prefs.getString('price_k') == 'kr')
                                ? snapshot.data.data![index].priceK.toString()
                                : snapshot.data.data![index].price.toString(),
                            image:
                                snapshot.data.data![index].coverImg.toString(),
                            name: snapshot.data.data![index].name.toString(),
                          ),
                        ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
  }

  Widget buildSearchProduct({
    required String image,
    required context,
    required String price,
    required String name,
    // required String image,
  }) =>
      Card(
        child: Row(
          children: [
            Container(
                height: 24.h,
                width: 40.w,
                child: customCachedNetworkImage(
                    url: image, context: context, fit: BoxFit.contain)),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: HexColor('#515C6F'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (prefs.getString('price_k') == 'kr')
                        ? Text(
                            price + ' ' + 'Kr',
                            style: TextStyle(
                                color: HexColor('#4CB8BA'),
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          )
                        : Text(
                            price + ' ' + 'n\$',
                            style: TextStyle(
                                color: HexColor('#4CB8BA'),
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp),
                          ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      width: 1.5.w,
                    ),
                    Text(
                      '(4.5)',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: HexColor('#C9C9C9'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
            future: getSearchProduct(keyword: query.toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount: snapshot.data.data!.length,
                    itemBuilder: (context, index) => InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                        details: snapshot.data.data![index],
                                      ))),
                          child: buildSearchProduct(
                            context: context,
                            price: (prefs.getString('price_k') == 'kr')
                                ? snapshot.data.data![index].priceK.toString()
                                : snapshot.data.data![index].price.toString(),
                            image:
                                snapshot.data.data![index].coverImg.toString(),
                            name: snapshot.data.data![index].name.toString(),
                          ),
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

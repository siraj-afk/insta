import 'dart:convert';


import 'package:http/http.dart';
import 'package:insta/repositery/model/instamodel.dart';

import '../../model/instamodel.dart';

import '../apiclient.dart';


class InstaApi {
  ApiClient apiClient = ApiClient();


  Future<InstaModel> getInsta() async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/info?username_or_id_or_url=mrbeast';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return InstaModel.fromJson(jsonDecode(response.body));
  }
}
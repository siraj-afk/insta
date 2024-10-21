import 'dart:convert';


import 'package:http/http.dart';
import 'package:insta/repositery/model/Followers.dart';
import 'package:insta/repositery/model/highlights.dart';
import 'package:insta/repositery/model/instamodel.dart';
import 'package:insta/repositery/model/postmodel.dart';
import 'package:insta/repositery/model/tagmodel.dart';

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


  Future<Highlights> getHighlights() async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/highlights?username_or_id_or_url=mrbeast';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Highlights.fromJson(jsonDecode(response.body));
  }

  Future<Post> getPostmodel() async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1.2/posts?username_or_id_or_url=mrbeast';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Post.fromJson(jsonDecode(response.body));
  }

  Future<Tag> getTagmodel() async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/tagged?username_or_id_or_url=mrbeast';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

   return Tag.fromJson(jsonDecode(response.body));
  }

  Future<Followers> getFollowersmodel() async {
    String trendingpath = 'https://instagram-scraper-api2.p.rapidapi.com/v1/followers?username_or_id_or_url=mrbeast';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Followers.fromJson(jsonDecode(response.body));
  }
}


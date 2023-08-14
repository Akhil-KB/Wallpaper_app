import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../Model/searchModel.dart';
import '../Model/latestModel.dart';
class WallpaperNetwork{
  getLatestWallpaper()
  async {
    final url = Uri.parse('https://api.pexels.com/v1/curated?per_page=50');
    final response = await http.get(url,headers: {
      'content-type': 'application/json',
      'Authorization':'2ganr2CpZswFFUfNEXJJtshxZ4eUWduKWZNLLz01qg4Wz6yFW4sp1UN0'
    },
    );
    if (response.statusCode == 200) {
      Latest latestFromJson = Latest.fromJson(json.decode(response.body));
      return latestFromJson.photos;

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  getCategoryWallpaper()
  async {
    final url = Uri.parse('https://api.pexels.com/v1/search?query=Abstract');
    final response = await http.get(url,headers: {
      'content-type': 'application/json',
      'Authorization':'2ganr2CpZswFFUfNEXJJtshxZ4eUWduKWZNLLz01qg4Wz6yFW4sp1UN0'
    },
    );
    if (response.statusCode == 200) {
      Search searchFromJson = Search.fromJson(json.decode(response.body));
      return  searchFromJson.photos;

    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

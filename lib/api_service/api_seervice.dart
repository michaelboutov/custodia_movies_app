import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'model.dart';

const String Api_Key = '712509a5';

class Services {
  static Future<List<MovieModel>> fetchData(String search) async {
    String url =
        "http://www.omdbapi.com/" + "?apikey=" + Api_Key + "&s=" + search;
    final response = await http.get(Uri.parse(url));
    log(url);
    if (response.statusCode == 200) {
      return fetchRatingAndGenre(json.decode(response.body)['Search'] as List);
    } else {
      throw Exception('Error');
    }
  }

  static Future<List<MovieModel>> fetchRatingAndGenre(
      List<dynamic> decode) async {
    List<MovieModel> resultList = [];
    for (dynamic i in decode) {
      String url = "http://www.omdbapi.com/" +
          "?apikey=" +
          Api_Key +
          "&i=" +
          i['imdbID'];
      log(url);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        resultList.add(MovieModel.fromJson(json.decode(response.body)));
      } else {
        throw Exception('Error');
      }
    }
    return resultList;
  }
}


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/movie.dart';
import 'package:http/http.dart' as http; 

class Webservice {

  Future<List<Movie>> fetchMovies(String keyword) async {

    final url = "http://www.omdbapi.com/?apikey=9acfd9c1&s=$keyword";

    debugPrint("AAA request: $url");
    final response = await http.get(url);
    if(response.statusCode == 200) {

       final body = jsonDecode(response.body);
       if (body["Response"] == "True"){
         final Iterable json = body["Search"];
         return json.map((movie) => Movie.fromJson(movie)).toList();
       }
       else{
         return null;
       }

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
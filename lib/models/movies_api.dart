import 'dart:convert';
import 'package:final_exam_list_view/models/movie.dart';
import 'package:http/http.dart' as http;

class MoviesApi {
  final String moviesUrl = "https://fcapi-1y70.onrender.com/movies";

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(moviesUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print("movie $jsonData");
      return jsonData.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
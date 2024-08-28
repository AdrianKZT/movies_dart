import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String rating;
  final String director;
  final String releaseDate;
  final String length;
  final String overview;

  Movie({
    required this.title,
    required this.rating,
    required this.director,
    required this.releaseDate,
    required this.length,
    required this.overview
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      rating: json['rating'].toString(),
      director: json['director'],
      releaseDate: json['release_date'],
      length: json['length'].toString(),
      overview: json['overview']
    );
  }
}

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Rating: ${movie.rating}',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Director: ${movie.director}',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Release Date: ${movie.releaseDate}',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

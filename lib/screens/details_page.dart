
import 'package:final_exam_list_view/models/movie.dart';
import 'package:flutter/material.dart'; // Assuming this file holds the Movie model

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //Padding.all(16.0),
          children: <Widget>[
            Text(
              movie.title, 
              style: const TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 20),
            Text(
              'Rating: ${movie.rating}', 
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 20),
            Text(
              'Director: ${movie.director}', 
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold
              ) 
            ),
            const SizedBox(height: 20),
            Text(
              'Release Date: ${movie.releaseDate}', 
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 20),
            Text(
              'Length: ${movie.length} Minutes', 
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 20),
            Text(
              'Overview: ${movie.overview}', 
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold
              ) 
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

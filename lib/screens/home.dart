import 'package:final_exam_list_view/models/movie.dart';
import 'package:final_exam_list_view/models/movies_api.dart';
import 'package:final_exam_list_view/screens/details_Page.dart';
import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<List<Movie>> futureMovies;

//   @override
//   void initState() {
//     super.initState();
//     futureMovies = MoviesApi().fetchMovies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Movies'),
//         centerTitle: true,
//       ),
//       body: 
//           FutureBuilder<List<Movie>>(
//       future: futureMovies,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Failed to load movies'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No movies available'));
//         } else {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return MovieItem(movie: snapshot.data![index]);
//             },
//           );
//         }
//       },
//     )
//     );
//   }
// }


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Movie>> futureMovies;
  List<Movie> allMovies = [];
  List<Movie> filteredMovies = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    futureMovies = MoviesApi().fetchMovies();
    futureMovies.then((movies) {
      setState(() {
        allMovies = movies;
        filteredMovies = movies;
      });
    });
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredMovies = allMovies
          .where((movie) => movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust horizontal padding
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search by title',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8)
              ),
              hintStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: updateSearchQuery,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<Movie>>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load movies'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No movies available'));
          } else {
            return ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                var movie = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsPage(movie: movie),
                      ),
                    );
                  },
                  child: MovieItem(movie: movie), // Your custom list item widget
                );
              },
            );
          }
        },
      ),
    );
  }
}
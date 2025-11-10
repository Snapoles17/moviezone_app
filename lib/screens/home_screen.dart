import 'package:flutter/material.dart';
import '../services/movie_service.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieService _movieService = MovieService();
  List<dynamic> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  void _loadMovies() async {
    try {
      final movies = await _movieService.fetchPopularMovies();
      setState(() {
        _movies = movies;
      });
    } catch (e) {
      print('Error al cargar películas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/movie_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Capa semitransparente
          Container(color: Colors.black.withOpacity(0.5)),

          // Contenido principal
          Column(
            children: [
              SizedBox(height: 60),
              Center(
                child: Text(
                  '🎬 MOVIEZONE',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Series", style: TextStyle(color: Colors.white)),
                  Text("Películas", style: TextStyle(color: Colors.white)),
                  Text("Categorías", style: TextStyle(color: Colors.white)),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text("Series y películas recomendadas", style: TextStyle(color: Colors.white)),
              ),
              Expanded(
                child: _movies.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                  itemCount: _movies.length,
                  itemBuilder: (context, index) {
                    final movie = _movies[index];
                    return MovieCard(
                      title: movie['title'],
                      description: 'Popularidad: ${movie['popularity']}',
                      imagePath: 'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
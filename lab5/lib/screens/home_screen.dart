import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../models/movie.dart';
import 'movie_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openDetails(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: movie)),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: sampleMovies.length,
          itemBuilder: (context, index) {
            final movie = sampleMovies[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 20),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => _openDetails(context, movie),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    Hero(
                      tag: 'poster-${movie.id}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(movie.posterUrl,
                            width: 80, height: 54, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(movie.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('☆ ${movie.rating} • ${movie.genres.join(', ')}'),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right),
                  ]),
                ),
              ),
            );
          },
        ),
      );
}

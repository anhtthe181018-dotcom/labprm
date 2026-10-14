import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.movie});
  final Movie movie;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool _isFavorite = false;
  int? _userRating;

  Future<void> _rateMovie() async {
    var selectedRating = _userRating ?? 0;

    final rating = await showDialog<int>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Rate this movie'),
          content: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(selectedRating == 0
                ? 'Choose a rating from 1 to 5 stars'
                : 'Your rating: $selectedRating / 5'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => IconButton(
                  tooltip: '${index + 1} stars',
                  iconSize: 34,
                  color: Colors.amber.shade700,
                  icon: Icon(index < selectedRating
                      ? Icons.star
                      : Icons.star_border),
                  onPressed: () =>
                      setDialogState(() => selectedRating = index + 1),
                ),
              ),
            ),
          ]),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel')),
            FilledButton(
              onPressed: selectedRating == 0
                  ? null
                  : () => Navigator.pop(context, selectedRating),
              child: const Text('Save rating'),
            ),
          ],
        ),
      ),
    );

    if (rating != null) setState(() => _userRating = rating);
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Scaffold(
      appBar: AppBar(title: Text(movie.title), backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(alignment: Alignment.bottomLeft, children: [
            Hero(
              tag: 'poster-${movie.id}',
              child: Image.network(movie.posterUrl,
                  height: 215, width: double.infinity, fit: BoxFit.cover),
            ),
            Container(
              height: 215,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(movie.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Wrap(
                spacing: 8,
                children: movie.genres
                    .map((genre) => Chip(label: Text(genre)))
                    .toList(),
              ),
              const SizedBox(height: 12),
              Text(movie.overview, style: const TextStyle(fontSize: 17)),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ActionButton(
                    icon: _isFavorite ? Icons.favorite : Icons.favorite_border,
                    label: 'Favorite',
                    onTap: () => setState(() => _isFavorite = !_isFavorite),
                  ),
                  _ActionButton(
                    icon: Icons.star,
                    label: 'Rate',
                    onTap: _rateMovie,
                  ),
                  _ActionButton(
                    icon: Icons.share,
                    label: 'Share',
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Share link copied.'))),
                  ),
                ],
              ),
              if (_userRating != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Your rating: $_userRating / 5',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              const SizedBox(height: 18),
              const Text('Trailers',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              ...movie.trailers.map((trailer) => Column(children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.play_circle_fill),
                      title: Text(trailer),
                    ),
                    const Divider(height: 1),
                  ])),
            ]),
          ),
        ]),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton(
      {required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Column(children: [
            Icon(icon, size: 30),
            const SizedBox(height: 5),
            Text(label),
          ]),
        ),
      );
}

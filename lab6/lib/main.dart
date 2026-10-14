import 'package:flutter/material.dart';

void main() => runApp(const ResponsiveMovieApp());

class Movie {
  const Movie(this.title, this.year, this.genres, this.posterUrl, this.rating);
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;
}

const allMovies = [
  Movie(
    'Dune: Part Two',
    2024,
    ['Sci-Fi', 'Adventure', 'Drama'],
    'https://picsum.photos/seed/dune/500/700',
    8.6,
  ),
  Movie(
    'Deadpool & Wolverine',
    2024,
    ['Action', 'Comedy'],
    'https://picsum.photos/seed/deadpool/500/700',
    8.3,
  ),
  Movie(
    'Inside Out 2',
    2024,
    ['Comedy', 'Animation', 'Drama'],
    'https://picsum.photos/seed/insideout/500/700',
    7.8,
  ),
  Movie(
    'The Wild Robot',
    2024,
    ['Animation', 'Adventure', 'Drama'],
    'https://picsum.photos/seed/wildrobot/500/700',
    8.1,
  ),
  Movie(
    'Oppenheimer',
    2023,
    ['Drama', 'Biography'],
    'https://picsum.photos/seed/oppenheimer/500/700',
    8.5,
  ),
  Movie(
    'Barbie',
    2023,
    ['Comedy', 'Adventure'],
    'https://picsum.photos/seed/barbie/500/700',
    6.9,
  ),
];

class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xff596aa5),
      scaffoldBackgroundColor: const Color(0xfffcf9ff),
    ),
    home: const GenreScreen(),
  );
}

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});
  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  static const _genres = [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Drama',
    'Sci-Fi',
    'Biography',
  ];
  String _query = '';
  String _sort = 'A-Z';
  final Set<String> _selected = {};

  List<Movie> get _movies {
    final items = allMovies
        .where(
          (movie) =>
              movie.title.toLowerCase().contains(_query.toLowerCase()) &&
              (_selected.isEmpty || movie.genres.any(_selected.contains)),
        )
        .toList();
    switch (_sort) {
      case 'Z-A':
        items.sort((a, b) => b.title.compareTo(a.title));
      case 'Year':
        items.sort((a, b) => b.year.compareTo(a.year));
      case 'Rating':
        items.sort((a, b) => b.rating.compareTo(a.rating));
      default:
        items.sort((a, b) => a.title.compareTo(b.title));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final movies = _movies;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width >= 800 ? 32 : 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find a Movie',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Browse movies by title, genre, year, or rating.'),
              const SizedBox(height: 20),
              TextField(
                onChanged: (text) => setState(() => _query = text),
                decoration: InputDecoration(
                  hintText: 'Search a movie title or keyword',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Text(
                    'Genres',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (_selected.isNotEmpty)
                    Badge(label: Text('${_selected.length}')),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () => setState(() {
                      _query = '';
                      _sort = 'A-Z';
                      _selected.clear();
                    }),
                    icon: const Icon(Icons.clear_all),
                    label: const Text('Clear'),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _genres
                    .map(
                      (genre) => FilterChip(
                        label: Text(genre),
                        selected: _selected.contains(genre),
                        onSelected: (yes) => setState(
                          () => yes
                              ? _selected.add(genre)
                              : _selected.remove(genre),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Text(
                    '${movies.length} movies',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text('Sort: '),
                  DropdownButton<String>(
                    value: _sort,
                    items: const ['A-Z', 'Z-A', 'Year', 'Rating']
                        .map(
                          (item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                    onChanged: (value) => setState(() => _sort = value!),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, box) {
                    if (movies.isEmpty)
                      return const Center(
                        child: Text('No matching movies found.'),
                      );
                    if (box.maxWidth >= 800)
                      return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 2.2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: movies
                            .map((movie) => MovieCard(movie: movie, wide: true))
                            .toList(),
                      );
                    return ListView.separated(
                      itemCount: movies.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, index) =>
                          MovieCard(movie: movies[index], wide: false),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie, required this.wide});
  final Movie movie;
  final bool wide;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              movie.posterUrl,
              width: wide ? 120 : 96,
              height: wide ? 130 : 112,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text('${movie.year} • ${movie.genres.join(", ")}'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(movie.rating.toString()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

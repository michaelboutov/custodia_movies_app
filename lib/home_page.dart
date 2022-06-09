import 'package:custodia_movies_app/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api_service/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextField(),
            ),
            const MoviesList()
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModel>(
      builder: (context, movies, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: "find movie",
            ),
            onSubmitted: (value) => movies.searchMovies(value),
            onChanged: (value) {
              movies.searchMovies(value);
            },
          ),
        );
      },
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModel>(builder: (context, movies, child) {
      return Container(
        child: movies.list.isEmpty
            ? Container()
            : Flexible(
                child: ListView.builder(
                  itemCount: movies.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieWidget(
                      item: movies.list[index],
                    );
                  },
                ),
              ),
      );
    });
  }
}

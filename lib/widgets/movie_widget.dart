import 'package:flutter/material.dart';

import '../api_service/model.dart';

class MovieWidget extends StatelessWidget {
  MovieModel item;
  MovieWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width - 30,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.24,
                    image: NetworkImage(item.poster_url),
                    placeholder: const AssetImage('images/placeholder.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      item.genre,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: double.parse(item.rating.toString()) > 7
                            ? Colors.green
                            : double.parse(item.rating.toString()) > 4
                                ? Colors.blue
                                : Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 18.0),
                        child: Text(
                          item.rating + " IMDB",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

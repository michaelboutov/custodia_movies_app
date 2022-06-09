import 'package:custodia_movies_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'api_service/model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SearchModel>(create: (_) => SearchModel()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: const HomePage(),
        ));
  }
}

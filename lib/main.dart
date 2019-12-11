import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_elo7/page/home_page.dart';
import 'blocs/product_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((i) => ProductsBloc())],
      child: MaterialApp(
        title: 'Projeto Elo7',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: HomePage(),
      ),
    );
  }
}

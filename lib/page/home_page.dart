import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_elo7/blocs/product_bloc.dart';
import 'package:teste_elo7/delegates/data_search.dart';
import 'package:teste_elo7/widgets/product_widget.dart';

import '../api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    // carrega a lista a primeira vez
    BlocProvider.getBloc<ProductsBloc>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String result =
                  await showSearch(context: context, delegate: DataSearch());
              if (result != null)
                BlocProvider.getBloc<ProductsBloc>().inSearch.add(result);
            },
          ),
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: BlocProvider.getBloc<ProductsBloc>().outProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: EdgeInsets.all(5.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ProductWidget(snapshot.data[index]);
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class VideosBloc {}

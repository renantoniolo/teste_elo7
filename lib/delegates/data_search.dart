import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste_elo7/api.dart';
import 'package:teste_elo7/models/product.dart';


class DataSearch extends SearchDelegate<String> {


  // Limpa o campo de busca 
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  // Botão voltar para view inicial
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((_)=>close(context, query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty)
      return Container();
    else
      return FutureBuilder<List>(
        future: suggestions(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]),
                  leading: Icon(Icons.toys),
                  onTap: () {
                    // envia o item selecionado para view principal
                    close(context,snapshot.data[index]);
                  },
                );
              },
              itemCount: snapshot.data.length,
            );
          }
        },
      );
  }

  // busca na webApi os produtos, e retorna somente o nome
  Future<List> suggestions(String search) async {

    Api api = new Api();
    List<String> products_str = new List<String>();
    List<Product> products = await api.search(search);

    for (var item in products) 
      products_str.add(item.title);
    
    // retorna a lista de nome de produtos filtrados
    return products_str;
  }


}
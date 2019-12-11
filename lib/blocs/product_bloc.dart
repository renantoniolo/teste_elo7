import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:teste_elo7/models/product.dart';
import '../api.dart';

class ProductsBloc implements BlocBase{

  Api api;
  List<Product> products = new List<Product>();

  final StreamController<List<Product>> _productsController = new StreamController<List<Product>>();
  Stream get outProducts => _productsController.stream;

  final StreamController<String> _searchController = new StreamController<String>();
  Sink get inSearch => _searchController.sink;

  ProductsBloc(){

    api = Api();
    _searchController.stream.listen(_search);
  }

  void _search(String search) async {

    products = await api.search(search);
    _productsController.sink.add(products);
  }

  void load() async {

    products = await api.searchAll();
    _productsController.sink.add(products);
  }
  
  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _productsController.close();
    _searchController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }


}
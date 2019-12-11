import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/product.dart';


class Api{

  Future<List<Product>> search(String search) async{

    http.Response response =  await http.get(
      "https://5dc05c0f95f4b90014ddc651.mockapi.io/elo7/api/1/products?q=$search"
    );

    return decode(response);
  }

  Future<List<Product>> searchAll() async{

    http.Response response =  await http.get(
      "https://5dc05c0f95f4b90014ddc651.mockapi.io/elo7/api/1/products"
    );

    return decode(response);
  }

  List<Product> decode(http.Response response){
    
    // lista de produtos
    List<Product> products = List<Product>();

    if(response.statusCode == 200){ // ok

      var decoded = json.decode(response.body);

      products = decoded.map<Product>(
        (map){
          return Product.fromJson(map);
        }
      ).toList();

      for (var item in products){

        if(item.price.installment == null){
          item.price.installment = "6x RS 5,38 sem juros";
        }

      }

      return products;

    }
    else { // erro
      return products;
    }

  }

}
import 'package:flutter/material.dart';
import 'package:teste_elo7/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 14.0 / 7.5,
              child: Image.network(product.picture, fit: BoxFit.cover),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          product.title,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(
                          product.price.current,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(
                          product.price.installment,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () async{
        // abre o link externo 
        await launch(product.sLink);
      },
    );
  }
}

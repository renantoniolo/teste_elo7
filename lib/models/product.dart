class Product {

  Price price;
  String picture;
  String title;
  String id;
  String sLink;

  Product({this.price, this.picture, this.title, this.id, this.sLink});

  Product.fromJson(Map<String, dynamic> json) {
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    picture = json['picture'];
    title = json['title'];
    id = json['id'];
    sLink = json['_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    data['picture'] = this.picture;
    data['title'] = this.title;
    data['id'] = this.id;
    data['_link'] = this.sLink;
    return data;
  }
}

class Price {
  String current;
  String installment;

  Price({this.current, this.installment});

  Price.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    installment = json['installment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['installment'] = this.installment;
    return data;
  }
}
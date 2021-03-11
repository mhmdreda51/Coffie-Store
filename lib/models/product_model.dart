class ProductModel {
  String name, image, description, price, productid;

  ProductModel(
      {this.name, this.image, this.description, this.productid, this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    price = map['price'];
    productid = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'productid': productid,
    };
  }
}

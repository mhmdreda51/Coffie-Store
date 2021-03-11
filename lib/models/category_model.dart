class CategoryModel {
  String name, image, description, price, productid;

  CategoryModel(
      {this.name, this.image, this.description, this.productid, this.price});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
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

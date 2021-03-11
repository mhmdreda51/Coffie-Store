import 'package:coffie/home_services.dart';
import 'package:coffie/models/category_model.dart';
import 'package:coffie/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoffieServices extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categoryModel => _categoryModel;

  List<CategoryModel> _categoryModel = [];
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];
  CoffieServices() {
    getCategory();
    getBestSellingProducts();
  }
  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }
}

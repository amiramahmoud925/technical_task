import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technical_task/Model/product_data.dart';

class ApiServices{
  Future<List<dynamic>> getProducts() async{
    final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode  ==200){
     final List<dynamic> data = jsonDecode(response.body);
     return data.map((json) => Product.fromJson(json)).toList();
    }else{
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  Future<List<String>> getCategories() async {
    final response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/categories"));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((category) => category.toString()).toList();
    } else {
      throw Exception('Failed to load categories: ${response.statusCode}');
    }
  }

}
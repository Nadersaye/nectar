import 'package:cloud_firestore/cloud_firestore.dart';

class ProductItemModel {
  final String? id;
  final String title;
  final String subtitle;
  final String type; //
  final String category; //
  final String company; //
  final String imageUrl; //
  final num rate; //
  final String benefits; //
  final String details; //
  final num price; //
  final num offerPrice; //
  final num? percent;

  ProductItemModel(
      {this.id,
      required this.title,
      required this.subtitle,
      required this.type,
      required this.category,
      required this.company,
      required this.imageUrl,
      required this.rate,
      required this.benefits,
      required this.details,
      required this.price,
      required this.offerPrice,
      this.percent});
  toJson() => {
        "type": type,
        "category": category,
        "company": company,
        "imageUrl": imageUrl,
        "rate": rate,
        "benefits": benefits,
        "details": details,
        "price": price,
        "offerPrice": offerPrice,
        "title": title,
        "subtitle": subtitle
      };
  factory ProductItemModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductItemModel(
      id: document.id,
      title: data['title'],
      subtitle: data['subtitle'],
      type: data['type'],
      category: data['category'],
      company: data['company'],
      imageUrl: data['imageUrl'],
      rate: data['rate'],
      benefits: data['benefits'],
      details: data['details'],
      price: data['price'],
      offerPrice: data['offerPrice'],
      percent: ((data['price'] - data['offerPrice']) / data['price'] * 100),
    );
  }
}

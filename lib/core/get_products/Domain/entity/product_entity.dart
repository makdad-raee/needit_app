import 'dart:io';

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String categoryID;
  final String name;
  final String description;
  final String code;
  final File? image;
  final bool isFeatured;
  String? imageUrl;
  final List<int>? colors;
  final num avRating;
  final num ratingCount;
  final List<String> sizes;
  final List<ReviewEntity> reviews;
  final num price; // السعر الفعلي اللي هيدفعه الزبون حالياً
  final num? originalPrice; // السعر الأصلي (قبل الخصم) - لو null يعني مافي خصم
  final bool isOffer;

  ProductEntity({
    required this.categoryID,
    required this.name,
    required this.description,
    required this.code,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.sizes,
    required this.colors,
    this.avRating = 0,
    this.ratingCount = 0,
    required this.reviews,
    this.id,
    required this.price,
    this.originalPrice,
    required this.isOffer,
  });

  @override
  List<Object?> get props => [id];
}

class ReviewEntity extends Equatable {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDescription;

  const ReviewEntity({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  @override
  List<Object?> get props => [name, rating, reviewDescription];
}

class ReviewModel extends ReviewEntity {
  const ReviewModel({
    required super.name,
    required super.image,
    required super.rating,
    required super.date,
    required super.reviewDescription,
  });
  factory ReviewModel.fromReviewEntity({required ReviewEntity reviewEntity}) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      rating: reviewEntity.rating,
      date: reviewEntity.date,
      reviewDescription: reviewEntity.reviewDescription,
    );
  }
  factory ReviewModel.fromMap({required Map<String, dynamic> map}) {
    return ReviewModel(
      name: map['name'] ?? 'name not provided',
      image: map['image'] ?? 'image not provided',
      rating: map['rating'] ?? 0,
      date: map['date'] ?? 'date not provided',
      reviewDescription:
          map['reviewDescription'] ?? 'review description not provided',
    );
  }
  factory ReviewModel.fromJson({required Map<String, dynamic> json}) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
      date: json['date'],
      reviewDescription: json['reviewDescripyion'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'date': date,
      'reviewDescripyion': reviewDescription,
    };
  }
}

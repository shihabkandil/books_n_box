import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../utils/constants/cache_keys.dart';

class Book extends Equatable {
  //
  @override
  List<Object?> get props => [id];

  final String? selfLink;
  final String? title;
  final String? description;
  final String? category;
  final double? avgRating;
  final int? ratingsCount;
  bool isBookmarked = false;
  int status = 0; //0 is none, 1 is TBR, 2 is buy etc
  final List<String>? authors;
  final Map<String, String>? imageLinks;
  final String id;

  Book(
      {required this.id,
      this.title,
      this.selfLink,
      this.authors,
      this.description,
      this.avgRating,
      this.ratingsCount,
      this.category,
      this.imageLinks,
      this.isBookmarked = false,
      this.status = 0});

  //static const empty = Book(id: '');

  //bool get isAuthenticated => this != Book.empty;
  //bool get isNotAuthenticated => this == Book.empty;
/*
  factory Book.fromJson(Map<String, dynamic> jsonModel) {
    return Book(
      selfLink: jsonModel[userCacheName],
      id: jsonModel[userCacheID] ?? '',
      email: jsonModel[userCacheEmail],
      profilePicturePath: jsonModel[userCacheProfilePicture],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      userCacheName: selfLink,
      userCacheID: id,
      userCacheEmail: email,
      userCacheProfilePicture: profilePicturePath,
    };
  }*/
}

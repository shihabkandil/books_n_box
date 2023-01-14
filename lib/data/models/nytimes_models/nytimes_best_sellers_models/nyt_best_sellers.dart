import 'dart:convert';

NytBestSellers nytBestSellersFromJson(String str) => NytBestSellers.fromJson(json.decode(str));

String nytBestSellersToJson(NytBestSellers data) => json.encode(data.toJson());

class NytBestSellers {
  String? status;
  String? copyright;
  int? numResults;
  Results? results;

  NytBestSellers({this.status, this.copyright, this.numResults, this.results});

  NytBestSellers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    numResults = json['num_results'];
    // print("---------------------------------------------------------------------------------------------------------------");
    // print(json['results']);
    results = json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['num_results'] = this.numResults;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  String? bestsellersDate;
  String? publishedDate;
  String? publishedDateDescription;
  String? previousPublishedDate;
  String? nextPublishedDate;
  List<BooksList>? lists;

  Results(
      {this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      //this.lists
  });

  Results.fromJson(Map<String, dynamic> json) {
    bestsellersDate = json['bestsellers_date'];
    publishedDate = json['published_date'];
    publishedDateDescription = json['published_date_description'];
    previousPublishedDate = json['previous_published_date'];
    nextPublishedDate = json['next_published_date'];
    if (json['lists'] != null) {
      lists = <BooksList>[];
      json['lists'].forEach((v) {
        lists!.add(new BooksList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bestsellers_date'] = this.bestsellersDate;
    data['published_date'] = this.publishedDate;
    data['published_date_description'] = this.publishedDateDescription;
    data['previous_published_date'] = this.previousPublishedDate;
    data['next_published_date'] = this.nextPublishedDate;
    if (this.lists != null) {
      data['lists'] = this.lists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BooksList {
  int? listId;
  String? listName;
  String? displayName;
  String? updated;
  List<BestSellerBook>? books;

  BooksList(
      {this.listId, this.listName, this.displayName, this.updated, this.books});

  BooksList.fromJson(Map<String, dynamic> json) {
    listId = json['list_id'];
    listName = json['list_name'];
    displayName = json['display_name'];
    updated = json['updated'];
    if (json['books'] != null) {
      books = <BestSellerBook>[];
      json['books'].forEach((v) {
        books!.add(new BestSellerBook.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list_id'] = this.listId;
    data['list_name'] = this.listName;
    data['display_name'] = this.displayName;
    data['updated'] = this.updated;
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestSellerBook {
  String? amazonProductUrl;
  String? author;
  String? bookImage;
  String? bookReviewLink;
  String? createdDate;
  String? description;
  String? price;
  String? bookUri;
  String? publisher;
  String? title;
  String? updatedDate;

  BestSellerBook({
    this.amazonProductUrl,
    this.author,
    this.bookImage,
    this.bookReviewLink,
    this.createdDate,
    this.description,
    this.price,
    this.bookUri,
    this.publisher,
    this.title,
    this.updatedDate,
  });

  BestSellerBook.fromJson(Map<String, dynamic> json) {
    amazonProductUrl = json['amazon_product_url'];
    author = json['author'];
    bookImage = json['book_image'];
    bookReviewLink = json['book_review_link'];
    createdDate = json['created_date'];
    description = json['description'];
    price = json['price'];
    bookUri = json['book_uri'];
    publisher = json['publisher'];
    title = json['title'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amazon_product_url'] = this.amazonProductUrl;
    data['author'] = this.author;
    data['book_image'] = this.bookImage;
    data['book_review_link'] = this.bookReviewLink;
    data['created_date'] = this.createdDate;
    data['description'] = this.description;
    data['price'] = this.price;
    data['book_uri'] = this.bookUri;
    data['publisher'] = this.publisher;
    data['title'] = this.title;
    data['updated_date'] = this.updatedDate;
    return data;
  }
}
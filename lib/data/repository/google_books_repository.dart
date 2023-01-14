import 'dart:io';
import 'package:http/http.dart';
import 'package:mobile_app_project/data/web_services/google_web_services.dart';

import '../models/google_books/google_book.dart';
import '../models/google_books/google_result.dart';

class GoogleBooksRepository {
  final GoogleWebService _googleWebServices;

  GoogleBooksRepository({GoogleWebService? googleWebService}) : _googleWebServices = googleWebService ?? GoogleWebService();

  Future<GoogleResult> getGoogleBooks(String query) async {
    try {
      Response results = await _googleWebServices.searchGoogleBooks(query: query);
      if (results.statusCode == 200) {
        return listOfBooksFromJson(results.body);
      }
    } on SocketException {
      throw SocketException;
    } catch (error) {
      throw error;
    }
    return GoogleResult();
  }

  Future<List<GoogleBook>> searchGoogleBooksByGenre(String genre_name) async {
  List<GoogleBook> booksInfo = [];
    try {
      Response results = await _googleWebServices.searchBooksByGenre(genre_name: genre_name);
      if (results.statusCode == 200) {
        var jsonResponse = listOfBooksFromJson(results.body);
        for (int i = 1; i < 6; i++) {
          booksInfo.add(jsonResponse.books![i]);
        }
        // print(booksInfo[1].volumeInfo!.authors);
        return booksInfo;
      }
    } on SocketException {
      throw SocketException;
    } catch (error) {
      throw error;
    }
    return booksInfo;
  }
}

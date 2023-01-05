import 'dart:io';
import 'package:http/http.dart';
import 'package:mobile_app_project/data/web_services/google_web_services.dart';

import '../models/google_books/google_result.dart';


class GoogleBooksRepository{
  final GoogleWebService _googleWebServices;

  GoogleBooksRepository({GoogleWebService? googleWebService}) : _googleWebServices = googleWebService ?? GoogleWebService();

  Future<GoogleResult> getGoogleBooks(String query) async {
    try {
      Response results = await _googleWebServices.searchGoogleBooks(query: query);
      if(results.statusCode == 200){
        return listOfBooksFromJson(results.body);
      }
    }
    on SocketException {
      throw SocketException;
    }
    catch(error){
        throw error;
    }
    return GoogleResult();
  }
}

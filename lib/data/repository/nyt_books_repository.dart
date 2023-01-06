import 'dart:io';
import 'package:http/http.dart';
import '../models/nytimes_models/nytimes_best_sellers_models/nyt_best_sellers.dart';
import '../web_services/nyt_web_services.dart';

class NytBooksRepository{
  final NytWebService _nytWebServices;

  NytBooksRepository({NytWebService? nytWebService})
      : _nytWebServices = nytWebService ?? NytWebService();

  Future<NytBestSellers> getBestSellersBooks() async {
    try {
      Response results = await _nytWebServices.getNytBooks(query: '/lists/overview.json');
      if(results.statusCode == 200){
        return nytBestSellersFromJson(results.body);
      }
    }
    on SocketException {
      throw SocketException;
    }
    catch(error){
        rethrow;
    }
    return NytBestSellers();
  }
}

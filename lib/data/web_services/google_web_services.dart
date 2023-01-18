import 'package:http/http.dart';
import '../../utils/constants/api_links.dart';
import 'package:http/http.dart' as http;

class GoogleWebService {
  Future<Response> searchGoogleBooks({required String query}) async {
    try {
      final uriRequest = Uri.parse(kGoogleBaseUrl + "?q=$query");
      Response response = await http.get(uriRequest);
      return response;
    } catch (e) {
      throw (e);
    }
  }

  Future<Response> searchBooksByGenre({required String genre_name}) async {
    try {
      var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': 'subject:' + genre_name});
      Response response = await http.get(url);
      return response;
    } catch (e) {
      throw (e);
    }
  }
}

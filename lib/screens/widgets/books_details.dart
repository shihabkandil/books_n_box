import 'package:http/http.dart' as http;
import 'package:mobile_app_project/data/models/google_books/google_result.dart';
import '../../data/models/google_books/google_book.dart';

class GoogleApi {
  Future<List<GoogleBook>> gbsApiCall(String genre_name) async {
    List<GoogleBook> booksInfo = [];
    var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': 'subject:' + genre_name});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = listOfBooksFromJson(response.body);
      for (int i = 1; i < 6; i++) {
        booksInfo.add(jsonResponse.books![i]);
      }
      return booksInfo;
    } else {
      return [];
    }
  }
}

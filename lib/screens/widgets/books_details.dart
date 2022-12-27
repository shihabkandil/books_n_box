import 'package:http/http.dart' as http;
import 'package:mobile_app_project/data/models/book_model/list_of_books.dart';
import '../../data/models/book_model/book.dart';

class GoogleApi {
  Future<List<Book>> gbsApiCall(String genre_name) async {
    List<Book> booksInfo = [];
    var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': 'subject:' + genre_name});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = listOfBooksFromJson(response.body);
      for (int i = 1; i < 6; i++) {
        booksInfo.add(jsonResponse.Books![i]);
      }
      return booksInfo;
    } else {
      return [];
    }
  }
}

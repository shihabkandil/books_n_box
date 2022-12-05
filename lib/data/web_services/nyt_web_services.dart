import 'package:http/http.dart';
import '../../utils/constants/strings.dart';
import 'package:http/http.dart' as http;

class NytWebService{
  Future<Response> getNytBooks({required String query})async{
    try{
      final uriRequest = Uri.parse("https://api.nytimes.com/svc/books/v3$query?api-key="+nyTimesApiKey);
      Response response = await http.get(uriRequest);
      print(response.body);
      return response;
    }
    catch(e){
      throw(e);
    }
  }
}
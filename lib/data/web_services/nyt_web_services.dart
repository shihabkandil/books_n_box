import 'package:http/http.dart';
import '../../utils/constants/strings.dart';
import 'package:http/http.dart' as http;

class NytWebService{
  Future<Response> getNytBooks({required String query})async{
    try{
      final uriRequest = Uri.parse(kNyTimesBaseUrl+"$query?api-key="+kNyTimesApiKey);
      Response response = await http.get(uriRequest);
      return response;
    }
    catch(e){
      throw(e);
    }
  }
}
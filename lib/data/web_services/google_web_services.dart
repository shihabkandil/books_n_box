import 'package:http/http.dart';
import '../../utils/constants/strings.dart';
import 'package:http/http.dart' as http;

class GoogleWebService{

  Future<Response> searchGoogleBooks({required String query})async{
    try{
      final uriRequest = Uri.parse(kGoogleBaseUrl+"?q=$query");
      Response response = await http.get(uriRequest);
      return response;
    }
    catch(e){
      throw(e);
    }
  }

}
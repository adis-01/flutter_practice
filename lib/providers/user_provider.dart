

import 'dart:convert';

import 'package:test_desktop/providers/base_provider.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserProvider extends BaseProvider<User>{


  UserProvider() :  super("Korisnici");



  Future<void> changePass(dynamic request) async{
    int korisnikID = 20;
    String endpoint = "Korisnici/PassChange/$korisnikID";
    var uri = Uri.parse("$baseUrl$endpoint");
    var headers = createHeaders();
    var object = jsonEncode(request);



    var response = await http.post(uri, headers: headers, body: object);
    
    if(isValidResponse(response)){
      var data = jsonDecode(object);
      print(data);
    }
    else{
      print('${response.statusCode}');
      throw Exception("greška");
    }
  }

  @override
  User fromJson(Map<String, dynamic> json) {
    print('fromJson');
    return User.fromJson(json);
  }


}

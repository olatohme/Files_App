import 'package:http/http.dart' as http;
import '../url.dart';
import '../model/grouo_model.dart';

class groupserves {
  var message;
  var url3 = Uri.parse('${url.domain}/api/group/get-all-groups');

  Future<List<The0>> getgroups(String token) async {
    print(url3);
    var response = await http.get(url3, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearar $token',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      //    var jsonresponse=jsonDecode(response.body);
      var groups = groupFromJson(response.body);
      return groups.the0;
    } else
      return [];
  }
}

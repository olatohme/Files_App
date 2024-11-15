import 'package:http/http.dart' as http;
import '../url.dart';

import '../model/groupdetails_model.dart';

class groupdetailsserves {
  var message;

  Future<Data> getdetailsgroups(String token, int id) async {
    var url3 = Uri.parse('${url.domain}/api/group/group-withuser/${id}');
    print(url3);
    var response = await http.get(url3, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearar $token',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      //    var jsonresponse=jsonDecode(response.body);
      var detailsgroups = groupdetailsFromJson(response.body);
      return detailsgroups.data;
    } else
      return Data(
          id: 0,
          name: '',
          userId: 0,
          createdAt: DateTime(0, 0, 0),
          user: new User(email: '', name: '', id: 0),
          members: []);
  }
}

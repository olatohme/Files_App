import 'package:files/model/reports_model.dart';
import 'package:http/http.dart' as http;
import '../url.dart';

class reportsserves {
  var message;
  var url3 = Uri.parse('${url.domain}/api/get-reports');

  Future<List<Datum>> getreports() async {
    print(url3);
    var response = await http.get(url3, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearar $token',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      //    var jsonresponse=jsonDecode(response.body);
      var reports = reportsFromJson(response.body);
      return reports.data;
    } else
      return [];
  }
}

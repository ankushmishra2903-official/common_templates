import 'package:http/http.dart' as http;
class Api {
  static var baseUrl = " ";
  static var login = baseUrl + "login.php";

  static var getData = baseUrl + "getData.php";
  static var setData = baseUrl + "setData.php";
}

httpPost({required url, required body}) async {
  var res = await http.post(Uri.parse(url), body: body);
  return res;
}
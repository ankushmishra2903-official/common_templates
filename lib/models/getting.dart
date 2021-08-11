import 'dart:convert';

import 'models.dart';

class Getting {
  static var req = "getting";

  static login({email, pass}) async {
    var res = await httpPost(url: Api.login, body: {
      req: "login",
      "email": email,
      "pass": pass,
    });
    List data =jsonDecode(res.body);
    if(data.isEmpty) {
      return 'Incorrect Email or password';
    } else {
      /*var info = data[0];
      var pref = await SharedPreferences.getInstance();
      pref.setString(PrefConst.userId, info['id']);
      pref.setString(PrefConst.userName, info['name']);
      pref.setString(PrefConst.userEmail, info['email']);
      pref.setString(PrefConst.userPass, info['password']);
      pref.setString(PrefConst.userPhone, info['phone']);
      pref.setString(PrefConst.userType, info['type']);*/
      return '';
    }
  }

}
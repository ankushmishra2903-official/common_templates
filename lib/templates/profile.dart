import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var _name = '', _mobile = '', _address = '', _oldPass = '';

  var _newName, _newMob, _newOldPass, _newPass, _newAddress;

  bool _status = true, _pStatus = false;

  final _key = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    _name = 'Ankush Mishra'; /*await getPref(key: nameKey);*/
    _mobile = '9752830486'; /*await getPref(key: mobileKey);*/
    _address = 'Dantewada'; /*await getPref(key: addressKey);*/
    _oldPass = '7974704221'; /*await getPref(key: passwordKey);*/
    if (mounted) {
      setState(() {});
    }
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  update() async {
    // await loading();
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      // var res = await updateDetails(name: _newName, mobile: _newMob, address: _newAddress);

      _newName = _name;
      _newAddress = _address;
      _newMob = _mobile;
      print("$_newName, $_newAddress, $_newMob");

      /*if(!res['error']) {
        await setPref(key: nameKey, value: _newName);
        await setPref(key: mobileKey, value: _newMob);
        await setPref(key: addressKey, value: _newAddress);
        await getData();
        await success(text: 'Your Details are updated Successfully');
      } else {
        error(text: res['message']);
      }*/
    }
    // await loadingDismiss();
  }

  updatePass() async {
    // await loading();
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      if(_oldPass == _newOldPass){
        print("$_newOldPass, $_newPass");
       /* var res = await updatePassword(oldPass: _newOldPass, newPass: _newPass);
        if(!res['error']) {
          await setPref(key: passwordKey, value: _newPass);
          await getData();*/
          setState(() {
            _pStatus = !_pStatus;
          });
          // await success(text: 'Your Password is changed Successfully');
        // } else {
          // error(text: res['message']);
        // }
      } else {
        // error(text: 'Entered old password is wrong');

      }
    } else {
      // error(text: 'Validation Failed');
    }
    // await loadingDismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 25.h,
                  width: 100.w,
                  color: Colors.red,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              image: AssetImage('assets/profile.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        _name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Personal Information',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    _status ? _getEditIcon() : new Container(),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: _status
                                      ? Text(_name)
                                      : TextFormField(
                                    initialValue: _name,
                                    onSaved: (e) => _newName = e,
                                    decoration: const InputDecoration(
                                      hintText: "Enter Your Name",
                                    ),
                                    enabled: !_status,
                                    autofocus: !_status,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Mobile',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: _status
                                      ? Text(_mobile)
                                      : TextFormField(
                                    initialValue: _mobile,
                                    onSaved: (e) => _newMob = e,
                                    decoration: const InputDecoration(
                                      hintText: "Enter Your Name",
                                    ),
                                    enabled: !_status,
                                    autofocus: !_status,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 25.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    new Text(
                                      'Address',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Flexible(
                                  child: _status
                                      ? Text(_address)
                                      : TextFormField(
                                    initialValue: _address,
                                    onSaved: (e) => _newAddress = e,
                                    decoration: const InputDecoration(
                                      hintText: "Enter Your Name",
                                    ),
                                    enabled: !_status,
                                    autofocus: !_status,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _pStatus
                              ? Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Old Password',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                              : SizedBox(
                            height: 0,
                          ),
                          _pStatus
                              ? Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: TextFormField(
                                      onSaved: (e) => _newOldPass = e,
                                      decoration: const InputDecoration(
                                          hintText: "Enter old Password"),
                                      obscureText: true,
                                    ),
                                  ),
                                ],
                              ))
                              : SizedBox(
                            height: 0,
                          ),
                          _pStatus
                              ? Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'New Password',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                              : SizedBox(
                            height: 0,
                          ),
                          _pStatus
                              ? Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: TextFormField(
                                      onSaved: (e) => _newPass = e,
                                      decoration: const InputDecoration(
                                          hintText: "Enter new Password"),
                                      obscureText: true,
                                    ),
                                  ),
                                ],
                              ))
                              : SizedBox(
                            height: 0,
                          ),
                          !_status
                              ? Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 45.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Container(
                                      child: new ElevatedButton(
                                        child: new Text("Save"),
                                        style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.green),
                                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                                shape: MaterialStateProperty.all(new RoundedRectangleBorder(
                                                    borderRadius:
                                                    new BorderRadius.circular(
                                                        20.0))),
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            _status = true;
                                          });

                                          update();
                                        },
                                      ),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Container(
                                        child: new ElevatedButton(
                                          child: new Text("Cancel"),
                                          style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                                shape: MaterialStateProperty.all(new RoundedRectangleBorder(
                                                    borderRadius:
                                                    new BorderRadius.circular(
                                                        20.0))),
                                              ),
                                          onPressed: () {
                                            setState(() {
                                              _status = true;
                                            });
                                          },
                                        )),
                                  ),
                                  flex: 2,
                                ),
                              ],
                            ),
                          )
                              : Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: _pStatus
                                ? MainAxisAlignment.spaceEvenly
                                : MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Container(
                                  child: new ElevatedButton(
                                    child: _pStatus
                                        ? Text("Save Password")
                                        : Text("Change Password"),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.green),
                                      foregroundColor: MaterialStateProperty.all(Colors.white),
                                      shape: MaterialStateProperty.all(new RoundedRectangleBorder(
                                          borderRadius:
                                          new BorderRadius.circular(
                                              20.0)))),
                                    onPressed: () {
                                      if (_pStatus) {
                                        updatePass();
                                      } else {
                                        setState(() {
                                          _pStatus = !_pStatus;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              if (_pStatus) ...[
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    child: new ElevatedButton(
                                      child: Text("Cancel"),
                                      style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                                foregroundColor: MaterialStateProperty.all(Colors.white),
                                                shape: MaterialStateProperty.all(new RoundedRectangleBorder(
                                                    borderRadius:
                                                    new BorderRadius.circular(
                                                        20.0))),
                                              ),
                                      onPressed: () {
                                        setState(() {
                                          _pStatus = !_pStatus;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

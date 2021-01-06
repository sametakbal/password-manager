import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/models/generator_password_dto.dart';
import 'package:toast/toast.dart';

class GeneratePage extends StatefulWidget {
  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  final TextEditingController passwordEditTextController =
      TextEditingController();
  GeneratePasswordDto gpdto = GeneratePasswordDto();

  @override
  void initState() {
    getPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          passwordTextField(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Password Length: ${gpdto.lenght} - ${getPasswordLevel()}',
              style: TextStyle(),
            ),
          ),
          passwordLengthSlider(),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text('Include Lowercase Characters (a,b,c,d...)'),
              trailing: Checkbox(
                  value: gpdto.includeLowercaseCharacters,
                  onChanged: (bool val) {
                    setState(() {
                      gpdto.includeLowercaseCharacters = val;
                    });
                  }),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text('Inlcude Uppercase Characters (A,B,C,D...)'),
              trailing: Checkbox(
                  value: gpdto.includeUpperCaseCharacters,
                  onChanged: (bool val) {
                    setState(() {
                      gpdto.includeUpperCaseCharacters = val;
                    });
                  }),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text('Inclue Numbers (1,2,3,4,5,6,7,8,9,0)'),
              trailing: Checkbox(
                  value: gpdto.includeNumbers,
                  onChanged: (bool val) {
                    setState(() {
                      gpdto.includeNumbers = val;
                    });
                  }),
            ),
          ),
          Card(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text('Inclue Symbols (@,&,%,#...)'),
              trailing: Checkbox(
                  value: gpdto.includeSymbols,
                  onChanged: (bool val) {
                    setState(() {
                      gpdto.includeSymbols = val;
                    });
                  }),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text('Exclude Ambiguous Character ({},][,~...)'),
              trailing: Checkbox(
                  value: gpdto.includeAmbiguousCharacters,
                  onChanged: (bool val) {
                    setState(() {
                      gpdto.includeAmbiguousCharacters = val;
                    });
                  }),
            ),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: getPassword,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(
              'Generate Password',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordTextField() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: TextFormField(
          controller: passwordEditTextController,
          textAlign: TextAlign.center,
          readOnly: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(Icons.content_copy),
                onPressed: () {
                  FlutterClipboard.copy(passwordEditTextController.text).then(
                      (value) => Toast.show('Password Copied!', context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.TOP));
                },
              )),
        ),
      ),
    );
  }

  Widget passwordLengthSlider() {
    return Slider(
      value: gpdto.lenght.toDouble(),
      onChanged: (double value) {
        setState(() {
          gpdto.lenght = value.toInt();
        });
      },
      min: 5,
      max: 32,
    );
  }

  void getPassword() {
    if (gpdto.checkCondition()) {
      setState(() {
        passwordEditTextController.text = gpdto.generatePassword();
      });
    } else {
      Toast.show('You must choose at least one condition!', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
    }
  }

  String getPasswordLevel() {
    if (gpdto.lenght >= 5 && gpdto.lenght < 8) {
      return 'Weak';
    } else if (gpdto.lenght >= 8 && gpdto.lenght < 12) {
      return 'Normal';
    } else if (gpdto.lenght >= 12 && gpdto.lenght < 16) {
      return 'Good';
    } else if (gpdto.lenght >= 16 && gpdto.lenght < 20) {
      return 'Very Good';
    } else if (gpdto.lenght >= 20 && gpdto.lenght < 24) {
      return 'Hard';
    } else if (gpdto.lenght >= 24 && gpdto.lenght < 30) {
      return 'Exaggeration';
    }
    return 'Extreme!!';
  }
}

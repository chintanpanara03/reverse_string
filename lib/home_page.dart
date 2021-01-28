import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> formKey = GlobalKey();
  List<String> reversedString = List();
  String mainString;
  String lastWord;
  buttonClick() {
    final formState = formKey.currentState;
    if (formState.validate()) {
      formState.save();
      reversedString.clear();
      int mainWord = int.parse(lastWord);
      setState(() {
        print(mainString);
        var def = mainString.split(RegExp(r"(?<=[.?!])")).toList();
        //def.removeLast();
        for (int i = 0; i < def.length; i++) {
          String ghi = def[i];
          var jkl = ghi.trim().split(' ');
          if (jkl.length >= mainWord) {
            var mno = jkl.length - mainWord;
            var stringOne = jkl.sublist(0, mno);
            var stringTwo = jkl.sublist(mno).join(' ');
            var reversest = stringOne.reversed.join(' ');
            String pqr = '$reversest $stringTwo';
            reversedString.add(pqr);
          } else {
            String asd = jkl.join(' ');
            reversedString.add(asd);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reverse String'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => mainString = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text with dot(.)';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Write Paragraph',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: (value) => lastWord = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter word';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Skip Last Word',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        child: Text('Submit'),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: buttonClick),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${reversedString.join(' ')}'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

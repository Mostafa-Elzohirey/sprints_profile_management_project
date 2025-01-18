import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
  String user_name = "Name";
  String gender = "Male";
  var list_item = ["Male", "Female"];
  TextEditingController name_controller = TextEditingController();
  TextEditingController age_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  bool isEmailValid(String email) {
    return EmailValidator.validate(email);
  }

  bool click = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: _notifier,
        builder: (_, mode, __) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: mode,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              home: Scaffold(
                  body: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            user_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                        IconButton(
                          icon: Icon((click == false)
                              ? Icons.light_mode
                              : Icons.dark_mode),
                          onPressed: () {
                            _notifier.value = mode == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light;
                            setState(() {
                              click = !click;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: name_controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "please enter a valid email";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1, //<-- SEE HERE
                                      color: Color(0xFF979797),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      width: 2, //<-- SEE HERE
                                      color: Color(0xFF979797),
                                    ),
                                  ),
                                  labelText: "Name",
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 162, 162, 162),
                                  )),
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    controller: phone_controller,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 11) {
                                        return "Please enter a valid phone";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 1, //<-- SEE HERE
                                            color: Color(0xFF979797),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            width: 2, //<-- SEE HERE
                                            color: Color(0xFF979797),
                                          ),
                                        ),
                                        labelText: "Phone",
                                        labelStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 162, 162, 162),
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    controller: age_controller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your age";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 1, //<-- SEE HERE
                                            color: Color(0xFF979797),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            width: 2, //<-- SEE HERE
                                            color: Color(0xFF979797),
                                          ),
                                        ),
                                        labelText: "Age",
                                        labelStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 162, 162, 162),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: email_controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your name";
                                }
                                if (!isEmailValid(value)) {
                                  return 'Please enter a valid email address';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 1, //<-- SEE HERE
                                      color: Color(0xFF979797),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      width: 2, //<-- SEE HERE
                                      color: Color(0xFF979797),
                                    ),
                                  ),
                                  labelText: "Email",
                                  labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 162, 162, 162),
                                  )),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 55,
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color(0xFF979797), width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DropdownButtonFormField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: ""),
                                      hint: Text(
                                        gender,
                                        style: TextStyle(
                                          color: Color(0xFF979797),
                                        ),
                                      ),
                                      items: list_item.map((String item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          gender = newValue!;
                                        });
                                      },
                                      value: gender,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please choose your gender";
                                        }
                                        return null;
                                      },
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    controller: address_controller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your address";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 1, //<-- SEE HERE
                                            color: Color(0xFF979797),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            width: 2, //<-- SEE HERE
                                            color: Color(0xFF979797),
                                          ),
                                        ),
                                        labelText: "Address",
                                        labelStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 162, 162, 162),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // styling the button

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    backgroundColor:
                                        Color(0xFF646464), // Button color
                                  ),
                                  onPressed: () {
                                    debugPrint(name_controller.text);
                                    debugPrint(age_controller.text);
                                    debugPrint(email_controller.text);
                                    debugPrint(address_controller.text);
                                    debugPrint(phone_controller.text);
                                    debugPrint(gender);
                                    if (_formKey.currentState!.validate()) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Alert'),
                                            content: Text('Edited successfuly'),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Alert'),
                                            content: Text('invalid data'),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Close'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ))),
                        ])),
                  ],
                ),
              )));
        });
  }
}

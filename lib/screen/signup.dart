import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({Key? key}) : super(key: key);

  @override
  _SignUPScreenState createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {

  //textform validate
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();

  //dropdownlist
  String dropdownvalue = 'Gender';
  var items = ['Gender', 'Male', 'Female'];

  //datepicker

  String _selectedDate = 'Date Of Birth';

  Future<void> opendatepicker(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime
          .now()
          .year - 3),
      lastDate: DateTime(DateTime
          .now()
          .year + 3),
    );
    if (d != null) {
      setState(() {
        _selectedDate = DateFormat.yMd("en_US").format(d);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.6,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1585089858717-f4378c2031d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                          fit: BoxFit.cover)),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 70, left: 20),
                    child: Text(
                      "Welcome",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.only(top: 330),

                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          topLeft: Radius.circular(80))),
                  child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.grey[700]),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  wordSpacing: 3,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                labelText: 'Your Name',
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please enter your Name';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                wordSpacing: 3,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0),
                              ),
                              labelText: 'Your Email',
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                wordSpacing: 3,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0),
                              ),
                              labelText: 'PassWord',
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter your Password';
                              } else if (val.length < 6) {
                                return 'Please enter password with atleast 6 chars';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _cpasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                wordSpacing: 3,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0),
                              ),
                              labelText: 'Confirm PassWord',
                            ),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter your ConfirmPassword';
                              } else if (val.length < 6) {
                                return 'Please enter cpassword with atleast 6 chars';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 3, top: 3),
                                  child: DropdownButton<String>(
                                    isExpanded: false,
                                    underline: Container(),
                                    value: dropdownvalue,
                                    icon: const Padding(
                                      padding: EdgeInsets.only(left: 60),
                                      child: Icon(Icons.keyboard_arrow_down),
                                    ),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                          value: items,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20),
                                            child: Text(
                                              items,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey[700]),
                                            ),
                                          ));
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),

                              Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2,
                                  )
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        _selectedDate,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey.shade700),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          opendatepicker(context);
                                        },
                                        icon: const Icon(
                                          Icons.calendar_today,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                print("Validated");
                                Navigator.of(context).pushNamed('/login');
                              } else {
                                print("Not Validated");
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey[700]),
                              child: const Center(
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You have accout ?",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[800]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/login');
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.deepOrange,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrivzou/auth/login.dart';

class ChangepassPage extends StatefulWidget {
  const ChangepassPage({super.key});

  @override
  State<ChangepassPage> createState() => _ChangepassPageState();
}

class _ChangepassPageState extends State<ChangepassPage> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController newpassCtrl;
  late TextEditingController confirnewpassCtrl;
  @override
  void initState() {
    newpassCtrl = TextEditingController();
    confirnewpassCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newpassCtrl.dispose();
    confirnewpassCtrl.dispose();
    super.dispose();
  }

  bool isobscure = true;
  bool isconfirmobscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkResponse(
                      // najmou nrapiyouh b positioned w t7tlou top w left values
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          CupertinoIcons.arrow_left_circle_fill,
                          color: Colors.teal.shade400,
                          size: 35,
                        ),
                      ),
                    ),
                  ]),
              const Text(
                "Create new password",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Create your new password for Nrivzou so you can login to your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              //////////
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: newpassCtrl,
                            obscureText: isobscure,
                            style: const TextStyle(color: Colors.black87),
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Colors.teal.shade200,
                                size: 27,
                              ),
                              suffixIcon: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isobscure = !isobscure;
                                    });
                                  },
                                  child: Text(
                                    isobscure ? "Show" : "Hide",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  )),
                              border: InputBorder.none,
                              hintText: 'New password',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.w400),
                            ),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                      .hasMatch(value)) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 18),
                              child: const Divider(
                                thickness: 1,
                                height: 1,
                                color: Colors.grey,
                              )),
                          TextFormField(
                            controller: confirnewpassCtrl,
                            obscureText: isconfirmobscure,
                            style: const TextStyle(color: Colors.black87),
                            cursorColor: Colors.teal.shade200,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: Colors.teal.shade200,
                                size: 27,
                              ),
                              suffixIcon: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isconfirmobscure = !isconfirmobscure;
                                    });
                                  },
                                  child: Text(
                                    isconfirmobscure ? "Show" : "Hide",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 17),
                                  )),
                              border: InputBorder.none,
                              hintText: 'Confirm new password',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontWeight: FontWeight.w400),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please confirm your new password";
                              }
                              if (value != newpassCtrl.text) {
                                return "Confirm password doesn't match ";
                              } else {
                                return null;
                              }
                            },
                          )
                        ],
                      ))),
              const SizedBox(
                height: 19,
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.teal.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        child: const Text(
                          'Reset password',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

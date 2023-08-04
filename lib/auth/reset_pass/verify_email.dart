import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrivzou/auth/reset_pass/verify_code.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final formKey =
      GlobalKey<FormState>(); //key for form !!!!!!!!!!!!!!!!!!!!!!!!

  late TextEditingController emailCtrl;
  @override
  void initState() {
    emailCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    super.dispose();
  }

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
                "Reset password",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "We will send you a verification code on your email.",
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
              Container(
                padding: const EdgeInsets.all(5),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                //////////////////////////////////////
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.mail_outline_rounded,
                              color: Colors.teal,
                              size: 27,
                            ),
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w400),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}')
                                    .hasMatch(value)) {
                              return "Please enter a valid mail";
                            } else {
                              return null;
                            }
                          },
                        )
                      ],
                    )),
                ////////////////////////
              ),
              const SizedBox(
                height: 20,
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
                          'Send verification Code',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const VerifyCodePage()));
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

import 'package:flutter/material.dart';
import 'package:http_methods/user_response/user_response.dart';

import 'app_button.dart';
import 'base_client.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _useridController = TextEditingController();

  String result_text = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Methods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _useridController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'User ID'),
                  ),
                ),
                AppButton(
                    title: "GET - Fetch Users",
                    actionfunction: () async {
                      final _number = _useridController.text;
                      final result = await getUser(userid: _number);
                      setState(() {
                        result_text =
                            result == null ? "No data found" : result.name;
                      });
                    }),
                AppButton(
                    title: "POST - Add Users",
                    actionfunction: () async {
                      UserResponse user = UserResponse(
                          name: "Anannya", id: 11, email: "ananya@gmail.com");
                      final result = await postUser(user);
                      if (result == null) return;
                      debugPrint("Succesfull");
                    }),
                AppButton(
                    title: "PUT - Edit Users",
                    actionfunction: () async {
                      String uid = '2';
                      UserResponse user = UserResponse(
                          name: "Anannya", email: "ananya@gmail.com");
                      final result = await putUser(userid: uid,object: user);
                      if (result == null) return;
                      debugPrint("Succesfull");
                    }),
                AppButton(
                    title: "DEL - Delete Users", actionfunction:() async {
                    
                      final result = await getUser(userid: '3');
                      if (result == null) return;
                      debugPrint("Succesfull");
                    }),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      result_text,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

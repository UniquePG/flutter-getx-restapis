import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  Future loginApi() async {
    try {
      loading.value = true;
      final response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {
            "email": emailController.value.text,
            "password": passwordController.value.text
          });

      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);

      if (response.statusCode == 200) {
        print("infiffff");
        loading.value = false;
        Get.snackbar("Login successfull", "Congratulation");
      } else {
        loading.value = false;
        Get.snackbar("Login Failed", "login failed");
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar("Exception", e.toString());
    }
  }
}

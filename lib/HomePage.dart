import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_rest_apis/controllers/login_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginController controller = Get.put(LoginController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailController.value,
                decoration: InputDecoration(hintText: "Enter email address"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.passwordController.value,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return InkWell(
                  onTap: () {
                    controller.loginApi();
                  },
                  child: controller.loading.value
                      ? CircularProgressIndicator()
                      : Container(
                          height: 45,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20),
                          )),
                        ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:little_dinosaur/Page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

_onboardInfo() async {
  print("Shared pref called");
  int isViewed = 0;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('onBoard', isViewed);
  print(prefs.getInt('onBoard'));
}

class _OnBoardState extends State<OnBoard> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 68, 148, 197),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Silahkan tulis nama kamu\nuntuk memulai",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Mali"),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextFormField(
                  controller: nameController,style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "Mali",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama tidak boleh kosong yaa';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Tulis Nama Kamu",
                    hintStyle:
                        TextStyle(color: Colors.grey, fontFamily: "Mali",fontWeight: FontWeight.w600),
                    hintMaxLines: 1,
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isElevated = !_isElevated;
                    Future.delayed(const Duration(milliseconds: 150), () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                      userame: nameController.text,
                                    )));
                      }
                    });
                  });
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 150),
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 68, 148, 197),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: _isElevated
                          ? [
                              const BoxShadow(
                                  color: Color.fromARGB(255, 35, 82, 111),
                                  offset: Offset(2, 2),
                                  blurRadius: 5,
                                  spreadRadius: 1),
                              const BoxShadow(
                                  color: Color.fromARGB(255, 93, 174, 225),
                                  offset: Offset(-2, -2),
                                  blurRadius: 5,
                                  spreadRadius: 1)
                            ]
                          : null),
                  child: const Text(
                    "Lanjut",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Mali",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

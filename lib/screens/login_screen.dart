import 'package:flutter/material.dart';
import 'package:flutter_auth_provider_app/screens/cpd_activity_welcome_sceen.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';



class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const HomeScreen({super.key});
  String img =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Emblem_of_the_Ministry_of_Education%2C_Youth_and_Sport_%28Cambodia%29.svg/888px-Emblem_of_the_Ministry_of_Education%2C_Youth_and_Sport_%28Cambodia%29.svg.png?20110624073833";

  AuthController loginController = Get.put(AuthController());

  var isLogin = false.obs;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff34a0bc),
      //inwell here is if u tocht anything in the screen u will close the keyboard
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: _buildBody(),
      ),

      //bottomNavigationBar: _buildNavigationBar(),
    );
  }

  bool _darkMode = true;
  bool _showPassword = true;
  String _text = "Welcome";

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: _buildFormLogin(),
    );
  }

  // Widget _buildPanelLogo() {
  Widget _buildPanel() {
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 10, 190, 235),
              Color.fromARGB(255, 252, 170, 170).withOpacity(0.5),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildEmailTextField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 20),
                _buildLoginButton(),
                _buildSignupButton(),
                _buildWelcomeButton(),
                // Text(
                //   _text,
                //   style: TextStyle(
                //       color: _darkMode
                //           ? Colors.white
                //           : Color.fromARGB(255, 94, 3, 250)),
                // ),
              ]),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 68, 118, 243),
        padding: EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 10,
        ),
      ),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          print(loginController.nameController.text);
          loginController.loginWithName();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Some fields are not validated"),
            ),
          );
        }
      },
      child: Text(
        "ចូលគណនី",
        style: TextStyle(color: const Color.fromARGB(255, 251, 249, 249)),
      ),
    );
  }

  Widget _buildFormLogin() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _buildPanelLogo(),
          Image.asset(
            "images/moeys.png",
            width: 150,
            height: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          Text("HRCPD",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 243),
                  fontFamily: 'Meta Chrieng',
                  fontSize: 20)),
          const SizedBox(
            height: 20,
          ),
          _buildPanel(),
        ],
      ),
    );
  }

  Widget _buildSignupButton() {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 68, 118, 243),
          padding: EdgeInsets.symmetric(
            horizontal: 80,
          )),
      onPressed: () {},
      child: Text(
        "ចុះឈ្មោះអ្នកប្រើប្រាស់",
        style: TextStyle(color: Color.fromARGB(255, 68, 118, 243)),
      ),
    );
  }

  Widget _buildWelcomeButton() {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 255, 255, 243),
          padding: EdgeInsets.symmetric(
            horizontal: 100,
          )),
      onPressed: () {
         Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WelcomeSceen(),
              ),
            );

      },
      child: Text(
        "Welcome to CPD",
        style: TextStyle(color: Color(0xff34a0bc)),
      ),
    );
  }

  final _passwordlCtrl = TextEditingController();
  Widget _buildPasswordField() {
    return TextFormField(
      controller: loginController.passwordController,
      obscureText: _showPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "បំពេញពាក្យសម្ងាត់របស់អ្នក",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.key),
        suffixIcon: IconButton(
          icon: Icon(
            _showPassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (text) {
        if (text!.isEmpty) {
          return "សូមបំពេញពាក្យសម្ងាត់របស់អ្នក";
        }
      },
    );
  }

  final _emailCtrl = TextEditingController();
  Widget _buildEmailTextField() {
    return TextFormField(
      controller: loginController.nameController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "បំពេញឈ្មោះឬអ៊ីមែលរបស់អ្នក",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.man),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (text) {
        if (text!.isEmpty) {
          return "សូមបំពេញឈ្មោះឬអ៊ីមែលរបស់អ្នក";
        }
      },
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      style: const TextStyle(
          color: Color.fromARGB(255, 253, 13, 13), fontFamily: 'ks'),
      decoration: InputDecoration(
        //filled: true,
        //fillColor: Colors.white,
        hintText: "ស្វែងរកកម្មវិធី",
        hintStyle: const TextStyle(color: Colors.white60),
        //hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      // leading: Icon(Icons.face),
      //FF: ព្រាល
      //RRGGBB:
      backgroundColor: const Color.fromRGBO(4, 126, 247, 1),
      // title: const Text("កម្មវិធីខ្មែរយើង",
      //     style: TextStyle(color: Colors.white, fontFamily: "ks")),
      title: _buildTextField(),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(img),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}

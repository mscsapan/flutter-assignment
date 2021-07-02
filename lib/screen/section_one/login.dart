import 'package:ami_coding_pari_na/network/auth.dart';
import 'package:ami_coding_pari_na/screen/section_two.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  final Function isLoggedIn;
  Login({required this.isLoggedIn});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passTextEditingController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  Authenticate _auth = Authenticate();
  bool visible = false;

  visibility() {
    setState(() {
      visible = !visible;
    });
  }

  validatedField() {
    var valid = _key.currentState!.validate();
    if (valid) {
      _auth.signInWithEmailAndPassword(
          emailTextEditingController.text, passTextEditingController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SectionTwo(), fullscreenDialog: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Login'),
          automaticallyImplyLeading: false,
          centerTitle: true),
      body: Column(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('Login',
                  textStyle: GoogleFonts.cambay(fontSize: 40),
                  speed: Duration(milliseconds: 300)),
            ],
            repeatForever: true,
          ),
          Form(
            key: _key,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: TextFormField(
                    controller: emailTextEditingController,
                    validator: (email) =>
                        email!.contains('@') && email.contains('.')
                            ? null
                            : "Wrong email",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.green,
                        )),
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: TextFormField(
                    controller: passTextEditingController,
                    validator: (pass) => pass!.isEmpty || pass.length <= 4
                        ? "Empty or short length"
                        : null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () => visibility(),
                            icon: visible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.red,
                        )),
                    obscureText: visible ? false : true,
                    style: TextStyle(fontSize: visible ? 18.0 : 20.0),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                onPressed: () => validatedField(),
                child: Text(
                  'Login',
                  style: GoogleFonts.openSans(fontSize: 20),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?", style: TextStyle(fontSize: 18)),
              GestureDetector(
                onTap: () => widget.isLoggedIn(),
                child: Text('Register',
                    style: GoogleFonts.aubrey(
                        fontSize: 18.0, decoration: TextDecoration.underline)),
              )
            ],
          ),
        ],
      ),
    );
  }
}

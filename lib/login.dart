import 'package:flutter/material.dart';
import 'package:primera/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final user = TextEditingController();
  final pass = TextEditingController();

  bool bandera = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.15, top: 20, right: size.width * 0.15, bottom: 20),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        print('SE DIO CLIC AL CONTENEDOR');
                      });
                    },
                    child: Container(
                      color: Colors.brown,
                      width: size.width * 0.25,
                      height: size.height * 0.1,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 25, color: Colors.red),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: user,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none
                            )
                        ),
                        filled: true,
                        fillColor: Colors.green,
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                        labelText: "Usuario"
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  TextFormField(
                    controller: pass,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.none
                            )
                        ),
                        filled: true,
                        fillColor: Colors.green,
                        prefixIcon: Icon(Icons.password, color: Colors.white),
                        labelText: "Contraseña"
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          print(user.text);
                          print(pass.text);
                          if(user.text == 'loris' && pass.text == '1234'){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          } else {
                            bandera = true;
                          }
                        });
                      },
                      child: const Text('INGRESAR', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        fixedSize: Size(size.width * 0.6, 45)
                      )
                  ),
                  SizedBox(height: size.height * 0.05),
                  bandera ? Text(
                    'Usuario o contraseña incorrectos',
                    style: TextStyle(color: Colors.red),
                  ) : Container()
                ],
              ),
            )
          ],
        )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:primera/constantes.dart' as cons;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List mensajes = [];

  @override
  void initState(){
    mensajes.add('1#Nuevo mensaje 1#usuario 1#Texto del mensaje');
    mensajes.add('2#Nuevo mensaje 2#usuario 2#Texto del mensaje');
    mensajes.add('3#Nuevo mensaje 3#usuario 3#Texto del mensaje');
    mensajes.add('4#Nuevo mensaje 4#usuario 4#Texto del mensaje');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: mensajes.length,
              itemBuilder: (BuildContext context, int index) {
                var datos = mensajes[index].split('#');

                return CardWidget(
                  texto: '${datos[1]} ${datos[2]}',
                  showOrHide: true,
                  size: 25,
                );
              }
          )
          /*SingleChildScrollView(
            child: Column(
            children: [
              CardWidget(
                texto: 'Nuevo mensaje 1',
                showOrHide: true,
                size: 25,
              ),
              CardWidget(
                texto: 'Nuevo mensaje 2',
                showOrHide: true,
                size: 50,
              ),
              CardWidget(
                texto: 'Nuevo mensaje 3',
                showOrHide: false,
                size: 15,
              ),
              CardWidget(
                texto: 'Nuevo mensaje 4',
                showOrHide: true,
                size: 5,
              ),
            ],
          ),
          ),*/
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.texto,
    required this.showOrHide,
    required this.size,
  });

  final String texto;
  final bool showOrHide;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cons.blanco,
      elevation: 15,
      child: Padding(
        padding: EdgeInsets.all(size),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Text(texto)),
            Expanded(
                flex: 1,
                child: Container(color: Colors.red, height: 20,)),
            Expanded(
                flex: 4,
                child: Icon(Icons.sms)),
          ],
        ),
      )
    );
  }
}


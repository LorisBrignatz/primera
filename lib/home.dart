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
                  texto: '${datos[1]}',
                  nombre: '${datos[2]}',
                  mensaje: '${datos[3]}',
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
    required this.nombre,
    required this.mensaje,
    required this.showOrHide,
    required this.size,
  });

  final String texto;
  final String nombre;
  final String mensaje;
  final bool showOrHide;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cons.blanco,
      elevation: 15,
      child: Padding(
        padding: EdgeInsets.all(size),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 6,
                    child: Text(texto)),
                Expanded(
                    flex: 6,
                    child: Text(nombre)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Text(mensaje)
                ),
                Expanded(
                  flex: 4,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                ),
              ],
            )
          ],
        )
      )
    );
  }
}


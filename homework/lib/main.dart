import 'package:flutter/material.dart';
import 'Dart:math';

// M A I N
void main() {
  runApp(
    MaterialApp(
      title: 'HomeWork',
      home: InicioV(),
    ),
  );
}

class InicioV extends StatefulWidget {
  InicioV();
  @override
  _InicioVState createState() => _InicioVState();
}

// P A N T A L L A    D E     I N I C I O
class _InicioVState extends State<InicioV> {
  TextEditingController _controller;
  String texto = '';
    String textoPag2 = '';
    var boton = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
//Container
            Container(
              width: 340,
              height: 280,
              color: Colors.transparent,
//Imagen
              child: Image.asset(
                'assets/img.png',
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
//Etiqueta
            Text(
              'Seleccione la acción a realizar',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//Botón de página 2
                RaisedButton(
                  child: Text('Página 2'),
                  onPressed: () {
//Ventana emergente
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Ingrese datos'),
//TextField
                        content: TextField(
                          controller: _controller,
                          onSubmitted: (palabra) {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SegundaV()),
                            );
                          },
                        ),
                        actions: <Widget>[
//Guardar
                          FlatButton(
                            child: Text('Guardar'),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              textoPag2 = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SegundaV(),
                                ),
                              );
                            },
                          ),
//Cancelar
                          FlatButton(
                              child: Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ],
                      ),
                    );
                  },
                ),
//Botón de página 3
                RaisedButton(
                  child: Text('Página 3'),
                  onPressed: () async {
                    boton = Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TerceraV();
                    })).toString();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
//Espaciador
                    Container(
                      height: 50,
                      color: Colors.transparent,
                    ),
                    Row(
                      children: <Widget>[
//Etiqueta
                        Text('Pag. 2 => $texto $textoPag2'),
                      ],
                    ),
//Espaciador
                    Container(
                      height: 20,
                      color: Colors.transparent,
                    ),
                    Row(
                      children: <Widget>[
//Etiqueta
                        Text('Pag. 3 => $boton'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//    S E G U N D A     V E N T A N A
class SegundaV extends StatefulWidget {
  SegundaV({Key key}) : super(key: key);

  @override
  _SegundaVState createState() => _SegundaVState();
}

class _SegundaVState extends State<SegundaV> {
  int rng = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda ventana"),
      ),
      body: Container(
//Fondo
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.lightBlue[50], Colors.white],
            stops: [0.2, 0.6, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
//Container RANDOM
                    Container(
                      child: Text(rng.toString()),
                    ),
//Botón GENERAR
                    RaisedButton(
                      child: Text('Generar'),
                      onPressed: () {
                        setState(() {
                          rng = Random().nextInt(999);
                        });
                      },
                    ),
//Botón GUARDAR
                    RaisedButton(
                      child: Text('Guardar'),
                      onPressed: () {
                        Navigator.of(context).pop(rng.toString());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//    T E R C E R A       V E N T A N A
class TerceraV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String boton1 = 'ಠ_ಠ';
    String boton2 = 'ʕ•ᴥ•ʔ';
    String boton3 = '◕‿◕｡';
    return Scaffold(
      appBar: AppBar(
        title: Text("Tercera ventana"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
//Botón 1
            RaisedButton(
              child: Text(boton1),
              onPressed: () {
                Navigator.of(context).pop(boton1);
              },
            ),
//Botón 2
            RaisedButton(
              child: Text(boton2),
              onPressed: () {
                Navigator.of(context).pop(boton2);
              },
            ),
//Botón 3
            RaisedButton(
              child: Text(boton3),
              onPressed: () {
                Navigator.of(context).pop(boton3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

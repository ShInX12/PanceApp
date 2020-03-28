import 'package:flutter/material.dart';

class ArrastrarPage extends StatefulWidget {
  @override
  _ArrastrarPageState createState() => _ArrastrarPageState();
}

class _ArrastrarPageState extends State<ArrastrarPage> {
  int completos = 0;
  final Map<String, bool> puntuacion = {'p1': false};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Reciclemos'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  puntuacion['p1'] == true ? boxContainer('ok') : createDragger('p1'),
                  puntuacion['l1'] == true ? boxContainer('ok') : createDragger('l1'),
                  puntuacion['o1'] == true ? boxContainer('ok') : createDragger('o1'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  puntuacion['o2'] == true ? boxContainer('ok') : createDragger('o2'),
                  puntuacion['l2'] == true ? boxContainer('ok') : createDragger('l2'),
                  puntuacion['p2'] == true ? boxContainer('ok') : createDragger('p2'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  puntuacion['l3'] == true ? boxContainer('ok') : createDragger('l3'),
                  puntuacion['o3'] == true ? boxContainer('ok') : createDragger('o3'),
                  puntuacion['p3'] == true ? boxContainer('ok') : createDragger('p3'),
                ],
              ),
              Divider(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  createDragtarget('p', context),
                  createDragtarget('o', context),
                  createDragtarget('l', context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createDragger(String basura) {
    return Draggable<String>(
      data: basura,
      child: boxContainer(basura),
      feedback: boxContainer(basura),
      childWhenDragging: boxContainer("origen"),
    );
  }

  Widget boxContainer(String item) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.25,
      width: size.width * 0.25,
      child: Image(image: AssetImage('assets/img/$item.png')),
    );
  }

  Widget createDragtarget(String caneca, BuildContext context) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        return boxContainer(caneca);
      },
      onWillAccept: (data) => data.substring(0, 1) == caneca,
      onAccept: (data) {
        setState(() {
          puntuacion[data] = true;
          puntuacion.forEach((basura, valor){
            if (valor == true){
              completos++;
            }
          });
          if (completos == 9){
            _mostrarAlert(context, "¡Felicidades!", "Has reciclado correctamente 😎");
          }
          completos = 0;
        });
      },
      onLeave: (data) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Caneca incorrecta"),
            backgroundColor: Colors.red,
            duration: Duration(milliseconds: 200),
          )
        );
      },
    );
  }

  void _mostrarAlert(BuildContext context, String titulo, String body){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(titulo),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(body),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: (){Navigator.of(context).pop();},
            )
          ],
        );
      }
    );
  }
}

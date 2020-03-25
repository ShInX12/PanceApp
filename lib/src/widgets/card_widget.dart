import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final AssetImage image;
  final String page;

  CardWidget({this.title, this.image, this.page});

  @override
  Widget build(BuildContext context) {
    return _card(context);
  }

  Widget _card(BuildContext context) {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: image,
            placeholder: AssetImage('assets/img/loading.jpg'),
            fadeOutDuration: Duration(milliseconds: 200),
            height: 130.0,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(title),
          )
        ],
      ),
    );

    return InkWell(
      onTap: () => Navigator.pushNamed(context, page),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 1.0),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: card,
        ),
      ),
    );
  }
}

library tiger_dialogbox;

/// Animated Customizable Dialog Box.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:studymate/widgets/TigerWidget.dart';

class StudymateDialogBox extends StatelessWidget {
  final String title;
  final String description;
  final String tigerAnimationType;
  final bool confirmation;
  final VoidCallback confirmationAction;

  StudymateDialogBox(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.tigerAnimationType,
      @required this.confirmation,
      this.confirmationAction});

  @override
  Widget build(BuildContext context) {
    dialogContent(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.1,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    List<Widget> bottomWidgetList;

    if (confirmation) {
      bottomWidgetList = <Widget>[
        FlatButton(
          onPressed: confirmationAction,
          child: Text('Yes'), // To confirm the dialog
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(); // To close the dialog
          },
          child: Text('No'),
        ),
      ];
    } else {
      bottomWidgetList = <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(); // To close the dialog
          },
          child: Text('Okay'),
        ),
      ];
    }

    return Stack(children: <Widget>[
      Container(
        padding: EdgeInsets.only(
          top: 66.0 + 16.0,
          bottom: 16,
          left: 16,
          right: 16,
        ),
        margin: EdgeInsets.only(top: 66),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
                spreadRadius: 2.0),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              // child: TigerWidget(
              //   animation: tigerAnimationType,
              // ),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: bottomWidgetList,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
final String text;
final Function handler;

AdaptiveFlatButton(this.text,this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            color: Colors.green[300],
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: handler,
                          )
                        : FlatButton(
                            textColor: Colors.green[300],
                            child: Text(
                              text,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: handler,
                          );
  }
}
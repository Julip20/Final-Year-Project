import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const TextInputDecoration =
InputDecoration(
               hintText: "Email",
               fillColor: Colors.white,
               filled: true,
               enabledBorder: OutlineInputBorder(
                 borderSide:  BorderSide(color: Colors.white, width: 2.0),
               ),
                 focusedBorder: OutlineInputBorder(
                 borderSide:  BorderSide(color: Colors.pink, width: 2.0),
               ),
             );
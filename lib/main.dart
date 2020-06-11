
import 'package:flutter/material.dart';
import './BackgroundColorManager.dart';

void main() {
  runApp(MaterialApp(home: SachinApp()));
}

class SachinApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SachinAppState();
  }
}

class _SachinAppState extends State<SachinApp> {
  Color color;
  BackgroundManager bgm = BackgroundManager();
  @override
  Widget build(BuildContext context) {
    
    return bgm;
  }
}

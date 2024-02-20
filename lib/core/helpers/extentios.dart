import 'package:flutter/material.dart';

extension Navigation on BuildContext {
Future<dynamic> pushNamed(String routerName,{Object? argument}){
  return Navigator.of(this).pushNamed(routerName,arguments: argument);
}

Future<dynamic> pushReplacementNamed(String routerName,{Object? argument}){
  return Navigator.of(this).pushReplacementNamed(routerName,arguments: argument);
}

Future<dynamic> pushNamedAndRemoveUntil(String routerName,{Object? argument,required RoutePredicate predicate}){
  return Navigator.of(this).pushNamedAndRemoveUntil(routerName,predicate,arguments: argument);
}
void pop() => Navigator.of(this).pop();
}
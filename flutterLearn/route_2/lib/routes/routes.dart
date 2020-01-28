import 'package:flutter/material.dart';

import '../pages/form.dart';
import '../pages/search.dart';
import '../pages/tabs.dart';
import '../pages/product.dart';
import '../pages/productinfo.dart';

final routes = {
  '/': (context, {arguments}) => Tabs(),
  '/form':(context, {arguments}) => FormPage(),
  '/search':(context, {arguments}) => SearchPage(arguments:arguments),
  '/product':(context, {argumengts})=>ProductPage(),
  '/productinfo':(context, {arguments})=>ProductinfoPage(arguments: arguments,),
};

var onGenerateRoute = (RouteSettings settings){
        //统一处理
        final String name = settings.name;
        print(" aaaa " + settings.name);

        final Function pageContentBuilder = routes[name];
        if(pageContentBuilder != null){
          if(settings.arguments != null){
            final Route route = MaterialPageRoute(
              builder: (context) => 
                pageContentBuilder(context, arguments: settings.arguments),
            );
            return route;
          }
          else{
            final Route route = MaterialPageRoute(
              builder: (context) => 
                pageContentBuilder(context)
            );
            return route;
          }
        }
      };
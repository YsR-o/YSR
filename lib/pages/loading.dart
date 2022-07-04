import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
 class Loading extends StatefulWidget {
   @override
   State<Loading> createState() => _LoadingState();
 }
 class _LoadingState extends State<Loading> {
   void setupWorldTime () async {
     WorldTime instance = WorldTime(location: 'khartoum', flag: 'sudan.png', url: '/Africa/Khartoum');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime':instance.isDaytime,
    } );
   }

   @override
   void initState(){
     super.initState();
   setupWorldTime();
   }
   @override
   Widget build(BuildContext context) {
     return   const Scaffold(
       backgroundColor: Colors.green,
       body: Center(
         child:   SpinKitWave(
             color: Colors.white,
             size: 50.0,
           ),
       ),
     );
   }
 }
 
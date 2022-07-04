import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    // set Background
    String bgImage = data['isDaytime']? 'day.png' : 'night.png';
    return  Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 24.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox (height: 15.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 38.0,
                    color: Colors.lightGreen,
                  ),
                ),
                SizedBox(height: 150.0),
                FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await  Navigator.pushNamed(context, '/location');
                      setState((){
                        data ={
                          'location': result['location'],
                          'flag': result['flag'],
                          'time':result['time'],
                          'isDaytime':result['isDaytime'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.location_on,
                    color: Colors.white,
                    ),
                    label: Text('change location',
                    style: TextStyle(
                      color: Colors.white,
                    ),)

                ),
              ],
            ),
          ),
        ),

      ),

    );
  }
}

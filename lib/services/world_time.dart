import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location ; //location name for UI
  late String time ; // the time in that location
  late String flag ; // url to an asset flag icon
  late String url ; // location url for api endpoint
  bool isDaytime =   true ;// true or false if day time or not

  WorldTime({required this.location,required this.flag,required this.url});

Future <void>getTime() async {
  try {
    // make the request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    //get properties from data
    String timeDate = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(timeDate);
    //print(offset);

    // create dataTime object

    DateTime now = DateTime.parse(timeDate);
    now =now.add(Duration(hours: int.parse(offset)));

    //set the time property
    isDaytime = now.hour> 5 && now.hour<19 ? true : false ;// true or false if day time or not
    time = DateFormat.jm().format(now);
  }
  catch (e){
    print('caught error $e');
    time = 'could not get time';
  }

}
}

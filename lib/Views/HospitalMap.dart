import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  Completer<GoogleMapController> _controller = Completer();
  double lat = 27.6736314;
  double long = 85.4038059;
  double zoomVal = 13;

  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospitals' Map"),
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
        ],
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        initialCameraPosition:
            CameraPosition(target: LatLng(this.lat, this.long), zoom: zoomVal),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          generateMarker('Bhaktapur Cancer Hospital','01-6611532',27.6731888,85.4223531,BitmapDescriptor.hueRed),
          generateMarker('Bhaktapur Hospital','01-6610798',27.6723693,85.4216772,BitmapDescriptor.hueRed),
          generateMarker('Bir Hospital','01-4221988',27.7048558,85.3136729,BitmapDescriptor.hueRed),
          generateMarker('Dhulikhel Hospital','011-490497',27.6167844,85.5479532,BitmapDescriptor.hueRed),
          generateMarker('Gangala Hospital','01-4371322',27.7451664,85.3425421,BitmapDescriptor.hueRed),
          generateMarker('Iwamura M. Hospital','01-6612695',27.6724581,85.4119409,BitmapDescriptor.hueRed),
          generateMarker("Kanti Children's Hospital",'01-4414798',27.7347007,85.3284831,BitmapDescriptor.hueRed),
          generateMarker('Kathmandu Cancer Hospital','01-5091629',27.6691276,85.4657824,BitmapDescriptor.hueRed),
          generateMarker('KMC Hospital','01-6616568',27.6842942,85.4110101,BitmapDescriptor.hueRed),
          generateMarker('Lokanthali Hospital','01-6631736',27.6740959,85.3597713,BitmapDescriptor.hueRed),
          generateMarker('Madhyapur Hospital','01-6631658',27.6722235,85.3881458,BitmapDescriptor.hueRed),
          generateMarker('Nagarik C. Hospital','01-6637700',27.6734834,85.3750281,BitmapDescriptor.hueRed),
          generateMarker('Nepal Eye Hospital','01-4250691',27.693155,85.3138475,BitmapDescriptor.hueRed),
          generateMarker('Nepal Korea Friendship Hospital','01-6633442',27.6788118,85.3837872,BitmapDescriptor.hueRed),
          generateMarker('Nepal Tuberculosis Control Center','01-6630706',27.6738084,85.3811783,BitmapDescriptor.hueRed),
          generateMarker('Patan Hospital','01-5522266',27.6680151,85.320148,BitmapDescriptor.hueRed),
          generateMarker('Sahid DharmaBhakta National Transplant Center','01-6614709',27.6729352,85.4216146,BitmapDescriptor.hueRed),
          generateMarker('Siddhi Memorial Women and Children Hospital','01-6612945',27.6681704,85.4326599,BitmapDescriptor.hueRed),
          generateMarker('Summit Hospital','01-6631736',27.6762386,85.3601327,BitmapDescriptor.hueRed),
        },
      ),
    );
  }

}
Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Marker generateMarker(String name,String tel,double lat,double lang,double colors){
  return Marker(
    markerId: MarkerId(name),
    position: LatLng(lat, lang),
    infoWindow: InfoWindow(title: name,snippet: tel,onTap: (){
      _makePhoneCall('tel:'+tel);
    }),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      colors,
    ),
  );

}

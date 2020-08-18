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
  double long = 85.4138059;
  double zoomVal = 13;

  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Police Station Map"),
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
          generateMarker('Mahanagariya Prahari Parisar -Bhaktapur','9851283020',27.6736376,85.4285093,BitmapDescriptor.hueRed),
          generateMarker('Mahanagariya Prahari Bit, Thimi','9851283599',27.6820978,85.3915049,BitmapDescriptor.hueRed),
          generateMarker('Mahanagariya Prahari Bit, Jagati','9851283028',27.6655182,85.438425,BitmapDescriptor.hueRed),
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

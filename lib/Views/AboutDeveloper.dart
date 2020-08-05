import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class AboutDeveloper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Developers'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Column(
            children: <Widget>[              
              DeveloperCard(
                name: "Bikesh Sitikhu",
                college:"KCE074BCT016",  
                email:"sitikhubikesh@gmail.com",              
                image: "assets/images/developers/bikesh.jpg",
              ),
              DeveloperCard(
                name: "Luja Shakya",                
                college:"KCE074BCT022",
                email:"shakyaluja445@gmail.com",                
                image: "assets/images/developers/luja.jpg",
              ),
              DeveloperCard(
                name: "Niranjan Bekoju",
                college:"KCE074BCT025",
                email:"bekojuniranjan@gmail.com",
                image: "assets/images/developers/niranjan.jpg",
              ),
              DeveloperCard(
                name: "Sunil Banmala",
                college:"KCE074BCT045",
                email:"sunilbanmala0@gmail.com",
                image: "assets/images/developers/sunil.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  DeveloperCard({Key key, this.name, this.college,this.email, this.image}) : super(key: key);
  String name, crn, image,college,email;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(                        
                          this.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Divider(),
                      Row(                        
                        children: <Widget>[   
                                                 
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.university), 
                            onPressed: () { print("Pressed"); }
                          ),
                          Text(                            
                            this.college,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.envelope), 
                            onPressed: () { print("Pressed"); }
                          ),
                          Text(
                            this.email,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 80,
                  margin: EdgeInsets.only(right: 10,left:10),

                  decoration: BoxDecoration(
                    boxShadow: [

                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset.fromDirection(90, 3),
                        blurRadius: 10.0,

                      ),
                    ],
                  ),
                  
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child:Image.asset(this.image),
                      
                  ),),
              ],
            ),
          )
          ),
    );
  }
}

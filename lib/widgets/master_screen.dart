import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_desktop/main.dart';
import 'package:test_desktop/screens/contact_screen.dart';
import 'package:test_desktop/screens/home_page_screen.dart';
import 'package:test_desktop/screens/user_profile_screen.dart';
import 'package:test_desktop/utils/dialogs.dart';

class MasterScreen extends StatefulWidget {
  String? titleWidget;
  Widget? body;
  MasterScreen({super.key, this.titleWidget, this.body});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleWidget ?? "Screen",style: TextStyle(letterSpacing: 2,fontWeight: FontWeight.bold,fontSize: 22),),
        centerTitle: true,
        titleSpacing: 15,
        toolbarOpacity: 0.7,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(
              Icons.car_rental_rounded,
              size: 30,
            ),
            padding: EdgeInsets.all(15.0),
          )
        ],
      ),
      drawer: Drawer(
          width: 400,
          child: ListView(
            children: [
              SizedBox(
                height: 215.5,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.view_list,
                            size: 33,
                            color: Colors.white,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.close,
                                size: 33,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/avatar.png"),
                            backgroundColor: Colors.white,
                            radius: 50,
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Jane Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(15), child: buildListTiles(context))
            ],
          )),
      body: widget.body,
    );
  }
}

Widget buildListTiles(BuildContext context) => Column(
      children: [
        _buildListTile('Home Page',Icons.home, 
          () { 
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen()
                )
              );
          }), 
          Divider(thickness: 0.53, color: Colors.grey),
        _buildListTile('User Profile', Icons.person_4,
         () {
             Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const UserProfile()
                )
              );
          }),
          Divider(thickness: 0.53, color: Colors.grey),
        _buildListTile('About us - Contact', Icons.phone,
       () { 

             Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  Contact()
                )
              );
        }),
        Divider(thickness: 0.53, color: Colors.grey),
        _buildListTile('Log Out', Icons.logout, 
        () { 
            MyDialog.showQuestion(context, 'Are you sure you want to log out?', () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
             });
        }),
        Divider(thickness: 0.53, color: Colors.grey),
        Center(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png",height: 175,color:Colors.blueAccent,),
              Text('eAutoSalon',
              style: TextStyle(
                fontSize: 35,fontWeight: FontWeight.bold, letterSpacing: 2, fontStyle: FontStyle.italic,color: Colors.blueGrey ),
              )
            ],
          ),
        )
      ],
    );

_buildListTile(String title, IconData icon, GestureTapCallback onTap)
{
  return ListTile(
          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          title: Text(
            '$title',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black54),
            textAlign: TextAlign.left,
          ),
          leading: Icon(
            icon,
            size: 25,
            color: Colors.blueGrey,
          ),
          onTap: onTap
        );

}
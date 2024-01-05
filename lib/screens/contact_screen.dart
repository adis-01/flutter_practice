import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_desktop/providers/story_provider.dart';
import 'package:test_desktop/widgets/master_screen.dart';
import 'package:http/http.dart' as http;

class Contact extends StatelessWidget {
  Contact({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MasterScreen(
      titleWidget: 'Contact',
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Icon(
                      Icons.access_time_outlined,
                      color: Colors.blueGrey,
                      size: 50,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Monday - Friday',
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.9,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '08:00 - 16:00',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.9,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Image.asset("assets/images/logo.png", height: 130, width: 150),
                Column(
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.location_on_outlined,
                            size: 40, color: Colors.blueGrey),
                        SizedBox(width: 10),
                        Text(
                          'Your location',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 0.7,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.phone_rounded,
                            size: 40, color: Colors.blueGrey),
                        SizedBox(width: 10),
                        Text(
                          '+387387387',
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 0.7,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              width: 650,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(8.5)),
              child: Padding(
                padding: EdgeInsets.all(35.5),
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){

                    }, child: Text('ID')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Icon(Icons.mail_outline_rounded, color: Colors.blueGrey, size:35,),
                        Text('Customer support',
                          style: TextStyle(
                            fontSize:22,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.blueGrey, thickness: 0.3),
                    const SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'This field cannot be null or empty';
                            }
                          },
                          decoration: 
                          InputDecoration(
                            icon: Icon(
                              Icons.contact_mail,
                              size:35
                            ),
                            labelText: 'Enter your mail address',
                            labelStyle: 
                            TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:15,
                            )
                          )    
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _contentController,
                          validator:(value) {
                            if(value == null || value.isEmpty){
                              return 'This field cannot be null or empty';
                            }
                          },
                          maxLines: 5,
                          decoration: 
                          InputDecoration(
                            icon: Icon(
                              Icons.edit_sharp,
                              size:35
                            ),
                            labelText: 'Write...',
                            labelStyle: 
                            TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:15,
                            )
                          )    
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(onPressed: (){
                              if(_formKey.currentState!.validate()){
                                _sendMail();
                              }
                            }, 
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(70, 35)
                            ),
                            child: Text('Send')
                            )
                          ],
                        )
                        ],
                      ) 
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Future<void> _sendMail() async{
    final uri = Uri.parse("https://localhost:7173/Contact/SendMailSupport");
    String auth = "Basic ${base64Encode(utf8.encode("savin0:wmd1234"))}";
    final headers = {
      'Content-Type' : 'application/json',
      'Authorization' : auth
    };

    final data = {
      'Mail': _emailController.text,
      'Content':_contentController.text 
    };

    var response = await http.post(uri,headers: headers,body: jsonEncode(data));

    if(response.statusCode < 299){
      print('post request successful | ${response.body}');
    }
    else{
      print('post request failed -> ${response.statusCode} -> ${response.toString()}');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_desktop/providers/story_provider.dart';
import 'package:test_desktop/providers/user_provider.dart';
import 'package:test_desktop/screens/home_page_screen.dart';
import 'package:test_desktop/utils/dialogs.dart';
import 'package:test_desktop/utils/utils.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => StoryProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hide = true;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  late StoryProvider _storyProvider;
  @override
  Widget build(BuildContext context) {
    _storyProvider = context.read<StoryProvider>();
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Login page',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            automaticallyImplyLeading: false,
            titleSpacing: 20,
            centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(10, 0))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.car_rental,
                      size: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 50,
                        ),
                        labelText: 'Enter your username',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: _passwordController,
                      obscureText: hide,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.key,
                            size: 50,
                          ),
                          labelText: 'Enter your password',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (hide == true) {
                                    hide = false;
                                  } else {
                                    hide = true;
                                  }
                                });
                              },
                              icon: Icon(hide == true
                                  ? Icons.lock
                                  : Icons.lock_open))),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var username = _usernameController.text;
                          var password = _passwordController.text;

                          Authorization.username = username;
                          Authorization.password = password;

                          try {
                            await _storyProvider.getAll();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                          } on Exception catch (e) {
                            MyDialog.showError(context, e.toString());
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(16))),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {print('home')},
          child: Icon(Icons.app_registration),
        ));
  }
}

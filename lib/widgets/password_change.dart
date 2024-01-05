import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:test_desktop/main.dart';
import 'package:test_desktop/providers/user_provider.dart';
import 'package:test_desktop/screens/user_profile_screen.dart';
import 'package:test_desktop/utils/dialogs.dart';
import 'package:test_desktop/utils/utils.dart';

class PasswordChangePForm extends StatefulWidget {
  const PasswordChangePForm({super.key});

  @override
  State<PasswordChangePForm> createState() => _PasswordChangePFormState();
}

class _PasswordChangePFormState extends State<PasswordChangePForm> {
  bool _obscureText1 = true;

  TextEditingController _oldPass = TextEditingController();
  TextEditingController _newPass = TextEditingController();
  TextEditingController _newPassRepeat = TextEditingController();
  late UserProvider _userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userProvider=context.read<UserProvider>();
  }

  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Change Password',
                      style: TextStyle(
                          letterSpacing: 0.3,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTextInput('Old password', _oldPass),
              const SizedBox(height: 10),
              _buildTextInput('New password', _newPass),
              const SizedBox(height: 10),
              _buildTextInput('Repeat new password', _newPassRepeat),
              const SizedBox(height: 20),
              const Divider(
                  color: Colors.blueGrey,
                  thickness: 0.4,
                  indent: 35,
                  endIndent: 35),
              Padding(
                padding: const EdgeInsets.all(13.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Nazad')),
                    const SizedBox(width: 50),
                    ElevatedButton(onPressed: () async {
                      String stari = _oldPass.text;
                      String novi = _newPass.text;
                      String noviPonovo = _newPassRepeat.text;

                      var request = {
                        "stari" : stari,
                        "novi" : novi,
                        "novi_ponovo" : noviPonovo
                      };
                      print('$request');
                      try {
                        await _userProvider.changePass(request);
                        MyDialog.showSuccess(context, 'Uspješno promijenjena lozinka, kliknite OK i logirajte se ponovno', () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (builder) => const LoginPage())
                          );
                         });
                      } catch (e) {
                        MyDialog.showError(context, e.toString());
                      }

                    }, child: Text('Potvrdi'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  _buildTextInput(String label, TextEditingController controller) {
    return SizedBox(
              width: 300,
              child: TextField(
                obscureText: _obscureText1,
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText1=!_obscureText1;
                        });
                      },
                      icon: _obscureText1
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)),
                ),
              ),
            );
  }
}

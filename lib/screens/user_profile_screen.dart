import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_desktop/providers/story_provider.dart';
import 'package:test_desktop/screens/home_page_screen.dart';
import 'package:test_desktop/utils/dialogs.dart';
import 'package:test_desktop/widgets/master_screen.dart';
import 'package:test_desktop/widgets/password_change.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late StoryProvider _storyProvider;
  bool _isSelected = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storyProvider = context.read<StoryProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreen(
      titleWidget: 'User Profile',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    splashRadius: 0.1,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const Text(
                    'Manage profile settings',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      fontStyle: FontStyle.italic,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(40.0),
                    decoration: _decorateContainer(context),
                    child: Padding(
                      padding: const EdgeInsets.all(10.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _iconSetup(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const SizedBox(height: 5),
                                  _stackBuild(context),
                                  const SizedBox(height: 15),
                                  _buildColumn1(context),
                                ],
                              ),
                              _buildColumn2(context),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(40.0),
                    decoration: _decorateContainer(context),
                    child: Padding(
                      padding: const EdgeInsets.all(10.5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isSelected = true;
                                  });
                                },
                                child: Text(
                                  'Comments',
                                  style: TextStyle(
                                    color: _isSelected
                                        ? Colors.blueAccent
                                        : Colors.black,
                                    fontSize: _isSelected ? 18 : 17,
                                    fontWeight: _isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isSelected = false;
                                  });
                                },
                                child: Text(
                                  'Payments',
                                  style: TextStyle(
                                    color: !_isSelected
                                        ? Colors.blueAccent
                                        : Colors.black,
                                    fontSize: !_isSelected ? 18 : 17,
                                    fontWeight: !_isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Divider(
                              thickness: 0.5,
                              color: Colors.black,
                              indent: 50,
                              endIndent: 50),
                          const SizedBox(height: 10),
                          Visibility(
                            visible: _isSelected,
                            child: Column(
                              children: [
                                _generateComment('15-12-2023'),
                                const SizedBox(height: 10),
                                _generateComment('12-12-2023'),
                                const SizedBox(height: 10),
                                _generateComment('15-11-2023'),
                                const SizedBox(height: 10),
                                _generateComment('02-08-2023'),
                                const SizedBox(height: 10),
                                _generateComment('26-05-2023'),
                                const SizedBox(height: 10),
                                const Text(
                                  "*These are the last 5 comments you've made",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !_isSelected,
                            child: Column(
                              children: const [
                                Text(
                                  "Successful payments",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Unfortunately, you have not made any payment transactions up to this date',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _stackBuild(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipOval(
            child: Image.asset(
          "assets/images/avatar.png",
          height: 180,
          width: 230,
          fit: BoxFit.contain,
        )),
        Tooltip(
          message: 'Change profile picture',
          child: Icon(Icons.camera_alt, size: 50, color: Colors.blueAccent),
        )
      ],
    );
  }

  Widget _generateComment(String date) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Icon(Icons.calendar_month, size: 20),
            SizedBox(width: 5),
            Text(
              date,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
            ),
            SizedBox(width: 5),
            Text("|"),
            SizedBox(
              width: 5,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  _iconSetup(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Icon(Icons.settings, size: 30, color: Colors.blueGrey),
    );
  }

  _decorateContainer(BuildContext context) {
    return BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(3, 0))
        ],
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 0.1,
        ));
  }

  _buildColumn1(BuildContext context) {
    return Column(
      children: const [
        Text(
          'jane_d03',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'User since Dec 25, 2023',
          style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  _buildColumn2(BuildContext context) {
    return Column(
      children: [
        RichText(
            text: const TextSpan(
                text: 'First name: ',
                children: [
                  TextSpan(
                      text: 'Jane',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17))
                ],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black))),
        const SizedBox(
          height: 20,
        ),
        RichText(
            text: const TextSpan(
                text: 'Last name: ',
                children: [
                  TextSpan(
                      text: 'Doe',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17))
                ],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black))),
        const SizedBox(
          height: 20,
        ),
        RichText(
            text: const TextSpan(
                text: 'Mail: ',
                children: [
                  TextSpan(
                      text: 'jane.doe@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 17))
                ],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black))),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            ElevatedButton(onPressed: (){
              print('password change');
              _openPopUpForm(context);
            }, child: Text('Change password')),
            SizedBox(width: 10.0),
            ElevatedButton(onPressed: (){
              print('profile edit');
            }, child: Text('Edit profile'))
          ],
        )
      ],
    );
  }

  void _openPopUpForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return PasswordChangePForm();
      },
    );
  }
}

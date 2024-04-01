import 'package:flutter/material.dart';
import 'package:flutter_test_1/shared_preferences/preferences.dart';

class UserFormScreen extends StatefulWidget {
   
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final usernameController=TextEditingController();

    void handleSendUserName(){
      if (_formKey.currentState!.validate()){
        final username = usernameController.value.text;
        Preferences.token=username;
        print(username);
        // Navigate to task screen
      }
    }

    return Scaffold(
      body: Center(
         child: Form(
          key: _formKey,
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget> [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Ingresa un usuario'
                    ),
                    validator: (String? username) {
                      if (username == null || username.isEmpty) {
                        return 'Ingresa un usuario para comenzar';
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: handleSendUserName, 
                  label: const Text('Comenzar')
                )
             ],
           ),
         ),
      ),
    );
  }
}
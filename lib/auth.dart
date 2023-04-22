import 'package:auth/secondpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final LocalAuthentication auth;
  bool _supportState= false;

  @override
  void initState(){
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported ) => setState((){
            _supportState = isSupported;
    }) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Biomerticrs"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_supportState)
            const Text("This devices is supported")
          else
            const Text("This devices is Not  supported"),

          const Divider(height: 100,),
          ElevatedButton(onPressed: _getAvailableBiometrics,
            child: const Text("Get Available Biometrics"),
          ),
          const Divider(height: 100,),
          ElevatedButton( onPressed: _authenticate,
            child: const Text("Authenticate"),
            //{ Navigator.push(context, MaterialPageRoute(builder:(context)=> SecondPage(),))}
    )
        ],
      ),

    );

  }
  Future <void> _authenticate()async{
    try {
      bool authenticated = await auth.authenticate(localizedReason: "put youre Finger Here ",
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: false,

          ),

      );

      print("Authenicated :$authenticated");
    }on PlatformException catch (e){
        print(e);

        }
  }
  Future<void> _getAvailableBiometrics() async
  {
    List<BiometricType> availableBiometrics =
     await auth.getAvailableBiometrics();

    print("List of availableBiometrics :$availableBiometrics");
    if (!mounted){
      return ;
    }

  }
}



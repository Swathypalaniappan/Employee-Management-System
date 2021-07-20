import 'package:employeedetail/addemployee.dart';
import "package:flutter/material.dart";
import 'package:employeedetail/deleteemployee.dart';
import 'package:employeedetail/editemployee.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

// Import the firebase_core plugin

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenPage(),
      title: "EmployeeManagementSystem",
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new Home(),
      title: Text(
        "Employee Management System",
        textScaleFactor: 2,
      ),
      image: Image.network(
          'https://tse2.mm.bing.net/th?id=OIP.-ZESd3uemaLXvRQqUYSMhwAAAA&pid=Api&P=0&w=300&h=300'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.amberAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 0.5,
                    spreadRadius: 0.5,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.supervised_user_circle,
                      ),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddEmployee()));
                      }),
                  Text("Add Employee Details", style: TextStyle(fontSize: 20)),
                ],
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              )),
          Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.pinkAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 0.5,
                    spreadRadius: 0.5,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.edit,
                      ),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserInformation()));
                      }),
                  Text("Edit Employee Details", style: TextStyle(fontSize: 20)),
                ],
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              )),
          Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blueAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 0.5,
                    spreadRadius: 0.5,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      iconSize: 50,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeleteEmployee()));
                      }),
                  Text("Delete Employee Details",
                      style: TextStyle(fontSize: 20)),
                ],
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              )),
        ],
      ),
    );
  }
}

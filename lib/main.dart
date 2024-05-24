import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:beritapps/screen/LoginScreen.dart';
import 'package:beritapps/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: kDefaultPadding,
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            print(snapshot.toString());
            if (snapshot.hasData) {
              ConnectivityResult? result = snapshot.data;
              if (result == ConnectivityResult.mobile) {
                return LoginPage();
              } else if (result == ConnectivityResult.wifi) {
                return LoginPage();
              } else {
                return nointernet();
              }
            } else {
              return loading();
            }
          },
        ),
      ),
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
            const Color.fromRGBO(47, 137, 252, 1.000)),
      ),
    );
  }

  Widget connected(String type) {
    return Center(
      child: Text(
        "$type Connected",
        style: const TextStyle(
          color: Color.fromRGBO(47, 137, 252, 1.000),
          fontSize: 20,
        ),
      ),
    );
  }

  Widget nointernet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: const Text(
            "Tidak ada koneksi internet",
            style: TextStyle(fontSize: 22),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: const Text("Periksa koneksi internet anda"),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(47, 137, 252, 1.000)),
          ),
          onPressed: () async {
            ConnectivityResult result =
                await Connectivity().checkConnectivity();
            print(result.toString());
          },
          child: const Text(
            "Refresh",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

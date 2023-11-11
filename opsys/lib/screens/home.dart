import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, title: "SchedMeUP", home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.blue,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 75.0,
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {},
                child: const Text("Play"),
              )),
          Container(
              height: 75.0,
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {},
                child: const Text("Play"),
              )),
          Container(
              height: 75.0,
              width: 300.0,
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {},
                child: const Text("Play"),
              )),
        ])),
      ),
    );
  }
}


import 'package:flutter/material.dart';





class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: fineaseAppBar(),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.lightBlue[100]!, Colors.lightBlue[200]!],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
  height: 50.0,
  decoration: BoxDecoration(
    color: Colors.blueGrey[300],
    borderRadius: BorderRadius.circular(15.0),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
         
        },
        
      ),
      IconButton(
        icon: const Icon(Icons.call_received),
        onPressed: () {
          
        },
      ),
    ],
  ),
)
            )
          ],
        )));
  }
}

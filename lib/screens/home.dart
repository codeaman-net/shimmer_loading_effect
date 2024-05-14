import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer Effect"),
      ),
      body: isLoading ? buildShimmerEffect() : buildProducts(),
    );
  }
}

Widget buildShimmerEffect() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            leading: Container(
              height: 48.0,
              width: 48.0,
              color: Colors.white,
            ),
            title: Container(
              height: 48.0,
              color: Colors.white,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 5.0),
                ),
                Container(
                  height: 14.0,
                  width: 100.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 5.0),
                )
              ],
            ),
          ));
    },
  );
}

Widget buildProducts() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return const ListTile(
        leading: Icon(Icons.shopping_cart_rounded),
        title: Text("Product Name"),
        subtitle: Text("Product Description"),
      );
    },
  );
}

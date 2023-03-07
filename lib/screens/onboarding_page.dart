import 'package:ecommerce_ui/screens/base_page.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fitHeight,
            image: const NetworkImage(
              'https://blog.hubspot.com/hs-fs/hubfs/ecommerce%20marketing.jpg?width=595&height=400&name=ecommerce%20marketing.jpg',
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.fromLTRB(35, 30, 35, 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.lightGreenAccent.shade200,
            ),
            child: Column(children: [
              const Text(
                'Find everything you need for sports',
                style: TextStyle(
                  wordSpacing: 2.5,
                  letterSpacing: 1,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Buy, store, trade, exchange, learn and earn crypto with a single tap.',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BasePage()));
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}

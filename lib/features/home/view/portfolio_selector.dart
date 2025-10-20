import 'package:flutter/material.dart';

class PortfolioSelector extends StatefulWidget {
  const PortfolioSelector({super.key});

  @override
  State<PortfolioSelector> createState() => _PortfolioSelectorState();
}

class _PortfolioSelectorState extends State<PortfolioSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCard(),
        buildCard()
      ],
    );
  }
  
  Widget buildCard(){
    return Container(
      child: Text("Oiiii", style: TextStyle(color: Colors.black),),
    );
  }
}

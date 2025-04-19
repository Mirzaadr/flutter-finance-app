import 'package:flutter/material.dart';

class CreditCardItem extends StatelessWidget {
  final Decoration? decoration;
  final String? leftText;
  final String? rightText;

  const CreditCardItem({
    super.key,
    this.decoration,
    this.leftText,
    this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Container(
        height: 150,
        decoration:
            decoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [Color(0xFF232526), Color(0xFF414345)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leftText ?? "L i f e  S t y l e",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: Text(
                rightText ?? "EURO",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

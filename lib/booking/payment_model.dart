import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentModel extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  const PaymentModel(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected});

  @override
  State<PaymentModel> createState() => _PaymentModelState();
}

class _PaymentModelState extends State<PaymentModel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 150,
        height: 130,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: widget.isSelected ? const Color(0xff3DA7E1) : Colors.grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.title == 'Credit Card'
                ? const Icon(Icons.payment)
                : const Icon(Icons.monetization_on),
            Text(
              widget.title,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

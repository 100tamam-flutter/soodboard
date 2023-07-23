import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart',
            style: TextStyle(
              color: Color(0xFF223263),
            )),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: 343,
            height: 104,
            child: Row(
              children: [
                Image.asset('assets/images/shoe.png'),
                const SizedBox(
                  width: 10,
                ),
                const Text('Nike Air Zoom Pegasus 36 Miami'),
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ],
            ),
          ),
          Container(
            width: 343,
            height: 104,
            child: Row(
              children: [
                Image.asset('assets/images/redshoe.png', height: 72, width: 72),
                const SizedBox(
                  width: 10,
                ),
                const Text('Nike Air Zoom Pegasus 36 Miami'),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

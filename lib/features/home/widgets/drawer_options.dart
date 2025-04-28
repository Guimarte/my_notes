import 'package:flutter/material.dart';

class DrawerOptions extends StatelessWidget {
  const DrawerOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Configurações '),
        ],
      ),
    );
  }
}

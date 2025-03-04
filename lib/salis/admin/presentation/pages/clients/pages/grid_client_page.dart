import 'package:flutter/material.dart';
import '/salis/admin/presentation/pages/clients/widgets/client_card.dart';

class GridClientPage extends StatelessWidget {
  const GridClientPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          ListView.builder(
            itemBuilder: (context, Index) {
              return ClientCard();
            },
            itemCount: 40,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {

    final messages = <String> [
      'Cargando Peliculas',
      'Compran palomitas de maiz',
      'Cargando Populares',
      'Ya mero...',
      'Bajale 2, ya casi',
      'En algun momento...',
      "2 años despues..."
    ];

    return Stream.periodic( const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('wait a minute'),
          const SizedBox(height: 10),

          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if ( !snapshot.hasData ) return const Text('Loading...');

              return Text(snapshot.data!);
            },
          )
        ],
      ),
    );
  }
}
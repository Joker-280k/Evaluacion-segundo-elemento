import 'package:app_final_fsjr/src/provider/jokes_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_final_fsjr/src/model/jokemodel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jokesProvider = JokesProvider();
    return Scaffold(
      appBar: AppBar(actions: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              'https://scontent.fmxl1-1.fna.fbcdn.net/v/t1.15752-9/217155375_4104058693011036_7070207742555196030_n.png?_nc_cat=105&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeHjX73dTH78e8vFZH7kSLpZAeM50KrEM0kB4znQqsQzSUwG0mB71krUkpRR9UsinH8nQ7aJX12vyb6Dnts319YZ&_nc_ohc=bUSjsJPBF-YAX8ScKQw&_nc_ht=scontent.fmxl1-1.fna&oh=167cbe271be136d88238ed90c22e4cd9&oe=60F275AB'),
        )
      ], centerTitle: true, title: Text('JOKES APP')),
      body: Card(
          color: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: FutureBuilder(
              future: jokesProvider.obtenerChistes(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<JokeModel>> snap) {
                final jokes = snap.data;
                return Container(
                  child: ListView.builder(
                    itemCount: jokes!.length,
                    itemBuilder: (BuildContext context, int i) {
                      final jokesData = jokes[i];
                      return Column(
                        children: [
                          Text(jokesData.category!),
                          Text(jokesData.type!),
                          Text(jokesData.joke!),
                          Text(jokesData.setup!),
                          Text('Answer: ${jokesData.delivery!}'),
                          SizedBox(height: 20.0)
                        ],
                      );
                    },
                  ),
                );
              })),
    );
  }
}

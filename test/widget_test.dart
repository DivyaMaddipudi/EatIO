import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

List data = [
  {
    'name': ' ',
    'image':
        'https://images.unsplash.com/photo-1527498913931-c302284a62af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    'description':
        'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
    'date': 'Mar 20, 2019',
    'rating': '4.7'
  },
  {
    'name': 'Genteng Lembang',
    'image':
        'https://images.unsplash.com/photo-1548560781-a7a07d9d33db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=581&q=80',
    'description':
        'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
    'date': 'Mar 24, 2019',
    'rating': '4,83'
  },
  {
    'name': 'Kamchatka Peninsula',
    'image':
        'https://images.unsplash.com/photo-1542869781-a272dedbc93e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=983&q=80',
    'description':
        'Over the years, Lover Antelope Canyon has become a favorite gathering pace for photographers tourists, and visitors from the world.',
    'date': 'Apr 18, 2019',
    'rating': '4,7'
  },
];

var profileImage =
    'https://www.imgmodels.com/sites/default/files/283adc16-7317-4189-bf7f-816367d68adf.jpg';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Search for place',
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: <Widget>[
                        Text(
                          'Destination',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.0),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        )
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 190.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: data.map((x) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondSceen(x)));
                      },
                      child: Hero(
                        tag: x['image'],
                        child: Container(
                          height: 190.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                  image: NetworkImage(x['image']),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SecondSceen extends StatelessWidget {
  final data;
  SecondSceen(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
          tag: data['image'],
          child: Image.network(
            data['image'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

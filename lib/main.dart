import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuctionScreen(),
    );
  }
}

class AuctionScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(
      brand: 'Volo',
      model: 'Type R',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellentesque urna sit amet molestie hendrerit.',
      price: '200,000',
      image: 'assets/car.png',
    ),
    Car(
      brand: 'Grand Chrusier',
      model: 'RX 7',
      description: 'Description of Model 2',
      price: '300,000',
      image: 'assets/car2.png',
    ),
    Car(
      brand: 'Mazda',
      model: '3',
      description: 'Description of Model 3',
      price: '250,000',
      image: 'assets/car3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auction App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              // Action to be performed when "Basket" button is pressed
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Basket'),
                    content: Text('List'),
                    actions: [
                      TextButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Gilang Mahardika (20200801241)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('My Bid'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Whitelist'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailPage(car: car),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    car.image,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${car.brand} ${car.model}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Price: \$${car.price}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          car.description,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Add ${car.brand} ${car.model} to Whitelist'),
                                      content: Text('This car will be added to your whitelist.'),
                                      actions: [
                                        TextButton(
                                          child: Text('Close'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  // primary: Colors.blue,
                                  // onPrimary: Colors.white
                              ),
                              // color: Colors.blue,
                              // textColor: Colors.white,
                              child: Text('Whitelist'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CarDetailPage(car: car),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white
                              ),
                              // color: Colors.blue,
                              // textColor: Colors.white,
                              child: Text('Bid'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Car {
  final String brand;
  final String model;
  final String description;
  final String price;
  final String image;

  Car({required this.brand,required this.model,required this.description,required this.price,required this.image});
}

class CarDetailPage extends StatefulWidget {
  final Car car;

  CarDetailPage({required this.car});

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  late TextEditingController _bidValueController;

  @override
  void initState() {
    super.initState();
    _bidValueController = TextEditingController();
  }

  @override
  void dispose() {
    _bidValueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              widget.car.image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              '${widget.car.brand} ${widget.car.model}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${widget.car.price}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.car.description,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Place your bid:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _bidValueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your bid amount',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String bidValue = _bidValueController.text;
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white
              ),
              child: Text('Place Bid'),
            ),
          ],
        ),
      ),
    );
  }
}
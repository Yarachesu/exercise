import 'package:flutter/material.dart';

class Pro extends StatefulWidget {
  //final int indexes;
  const Pro({
    super.key,
    //required this.indexes,
  });

  @override
  State<Pro> createState() => _ProState();
}

class _ProState extends State<Pro> {
  final images = [
    'assets/im1.jpg',
    'assets/im2.jpg',
    'assets/im3.jpg',
    'assets/prof.jpg',
    'assets/im1.jpg',
    'assets/im2.jpg',
    'assets/im3.jpg',
    'assets/prof.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
            size: 30,
          ),
        ),
        title: Center(
          child: Text(
            'Products',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: List.generate(8, (index) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                images[index],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 150,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'watch',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                '\$12',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: Material(
                              color: Color.fromARGB(214, 117, 73, 220),
                              child: IconButton(
                                onPressed: () {},
                                icon: Center(
                                  child: Icon(
                                    Icons.add,
                                    //color: Colors.purple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

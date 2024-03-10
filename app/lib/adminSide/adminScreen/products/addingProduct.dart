import 'package:app/database/auth.dart';
import 'package:app/database/storage.dart';
import 'package:app/utils/pickImages.dart';
import 'package:app/utils/snackBar.dart';
import 'package:app/utils/textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addPro extends StatefulWidget {
  const addPro({super.key});

  @override
  State<addPro> createState() => _addProState();
}

class _addProState extends State<addPro> {
  TextEditingController discriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: Center(
          child: Text(
            'Adding New Product',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFields(
            controller: titleController,
            hint: 'Title',
          ),
          textFields(
            controller: priceController,
            hint: 'Price',
          ),
          textFields(
            controller: discriptionController,
            hint: 'Description',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: file != null
                  ? Image(
                      image: MemoryImage(file!),
                      fit: BoxFit.fill,
                    )
                  : IconButton(
                      onPressed: () async {
                        Uint8List im = await pickedImages(
                          ImageSource.gallery,
                        );
                        setState(() {
                          file = im;
                        });
                      },
                      icon: Icon(
                        Icons.upload,
                        size: 30,
                        color: Colors.black87,
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: MaterialButton(
              color: Color.fromARGB(255, 112, 101, 185),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () async {
                String result = await authMethod().addProduct(
                  price: priceController.text,
                  description: discriptionController.text,
                  title: titleController.text,
                  photourl: file!,
                );
                if (result == 'success') {
                  showSnack(
                    'successfully added',
                    context,
                  );
                } else {
                  showSnack(
                    result,
                    context,
                  );
                }
              },
              height: 60,
              minWidth: 300,
              child: Center(
                child: Text(
                  'Upload New Product',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

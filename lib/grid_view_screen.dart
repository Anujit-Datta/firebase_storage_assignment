import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PhotoGrid extends StatefulWidget {
  const PhotoGrid({super.key});

  @override
  State<PhotoGrid> createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  final imagesRef = FirebaseStorage.instance.ref().child('photogrid');
  //List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    // fetchImages();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Grid'),
      ),
      body: StreamBuilder(
        stream: imagesRef.listAll().asStream(),
        builder: (context,AsyncSnapshot<ListResult> snapshot) {
          List<Reference> images=snapshot.data?.items ?? [];
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${snapshot.error}')));
            return const Center(child: Text('ERROR!', style: TextStyle(color: Colors.red),));
          }else{
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data?.items.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: FutureBuilder<String>(
                      future: images[index].getDownloadURL(),
                      builder: (context,AsyncSnapshot<String> stringSnapshot) {
                         if(snapshot.connectionState == ConnectionState.done && stringSnapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }else{
                            return Image.network(stringSnapshot.data!,fit: BoxFit.cover,);
                          }
                      }
                    ),
                  );
                },
              );
            }
          }
      ),
    );
  }
}

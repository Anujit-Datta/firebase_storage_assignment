import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

class PhotoGridScreen extends StatefulWidget {
  const PhotoGridScreen({super.key});

  @override
  State<PhotoGridScreen> createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGridScreen> {
  final imagesRef = FirebaseStorage.instance.ref().child('photogrid');
  List<String> imageUrls = [];
  bool fetchingInProgress=false;
  XFile? _pickedImage;

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Grid'),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await fetchImages();
        },
        child: Visibility(
          visible: !fetchingInProgress,
          replacement: const Center(child: CircularProgressIndicator(),),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){pickImage();},
        child: const Icon(Icons.add),
      ),
    );
  }

  fetchImages() async {
    fetchingInProgress=true;
    setState(() {});
    final ListResult result = await imagesRef.listAll();
    List<Reference> references = result.items;
    imageUrls.clear();
    for (Reference ref in references) {
      String url = await ref.getDownloadURL();
        imageUrls.add(url);
    }
    fetchingInProgress=false;
    setState(() {});
  }


  pickImage()async{
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      _pickedImage=value;
      uploadImage();
    });
  }

  uploadImage()async{
    // fetchingInProgress=true;
    setState(() {});
    if(_pickedImage==null){
      EasyLoading.showToast('Please pick an image first.',toastPosition: EasyLoadingToastPosition.bottom);
      return;
    }
    await FirebaseStorage.instance.ref().child('photogrid/${imageUrls.length+1}').putFile(File(_pickedImage!.path)).then((value) async{
      String url=await value.ref.getDownloadURL();
      imageUrls.add(url);
      // fetchingInProgress=false;
      setState(() {});
      EasyLoading.showToast('Image uploaded successfully.',toastPosition: EasyLoadingToastPosition.bottom);
    });
  }
}

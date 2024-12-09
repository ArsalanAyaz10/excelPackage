import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? _savedImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Image Test')),
          backgroundColor: const Color.fromARGB(255, 90, 206, 241),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                        allowedExtensions: ['xlsx','xls'],
                  );

                  if (result != null && result.files.single.path != null) {
                    String? filepath = result.files.single.path;

                    Uint8List? filebye = result.files.single.bytes;

                    setState(() {
                      _savedImage = savedimg;
                    });
                  }
                },
                child: const Text('Open File'),
              ),
            ),
            const SizedBox(height: 20),
            _savedImage != null
                ? Image.file(_savedImage!,height:500,width:500)
                : const Text('No image selected.',style: TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}

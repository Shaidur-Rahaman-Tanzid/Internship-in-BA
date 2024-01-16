import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class path_provider extends StatefulWidget {
  const path_provider({super.key});

  @override
  State<path_provider> createState() => _path_providerState();
}

class _path_providerState extends State<path_provider> {
  // Future<Directory?>? _tempDirectory;
  // Future<Directory?>? _documentDirectory;

  Future<Directory?>? getData() {
    var _doc = getApplicationDocumentsDirectory();
    return _doc;
  }

  Future<Directory?>? getTempDir() {
    var _gtd = getTemporaryDirectory();
    return _gtd;
  }

  Future<Directory?>? getAppCacheDir() {
    var _acd = getApplicationCacheDirectory();
    return _acd;
  }

  // void _requrstTempDirectory() {
  //   setState(() {
  //     _tempDirectory = getTemporaryDirectory();
  //   });
  // }

  // void _requestAppDirectory() {
  //   setState(() {
  //     _documentDirectory = getApplicationDocumentsDirectory();
  //   });
  // }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        text = Text('path: ${snapshot.data!.path}');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  Widget _buildDirectories(
      BuildContext context, AsyncSnapshot<List<Directory>?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        final String combined =
            snapshot.data!.map((Directory d) => d.path).join(', ');
        text = Text('paths: $combined');
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 55,
          ),
          // ElevatedButton(
          //     onPressed: _requrstTempDirectory, child: Text('Temp Path')),
          // SizedBox(
          //   height: 20,
          // ),
          // FutureBuilder<Directory?>(
          //     future: _tempDirectory, builder: _buildDirectory),
          // ElevatedButton(
          //     onPressed: _requestAppDirectory, child: Text('Permanent Path')),
          Text('Application Documents Directory'),
          FutureBuilder<Directory?>(
              future: getData(), builder: _buildDirectory),
          Text('Temporary Directory'),
          FutureBuilder<Directory?>(
              future: getTempDir(), builder: _buildDirectory),
          Text('Application Cache Directory'),
          FutureBuilder<Directory?>(
              future: getAppCacheDir(), builder: _buildDirectory),
        ],
      ),
    );
  }
}

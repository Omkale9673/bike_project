import 'package:bike_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';

class EditProfileModel {
  FFUploadedFile? uploadedLocalFile1;
  bool isDataUploading1 = false;

  void dispose() {}
}

class FFUploadedFile {
  final String name;
  final Uint8List? bytes;
  final double? height;
  final double? width;
  final String? blurHash;

  FFUploadedFile({
    required this.name,
    required this.bytes,
    this.height,
    this.width,
    this.blurHash,
  });
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late EditProfileModel _model;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  XFile? _aadharCardImage;
  XFile? _panCardImage;
  XFile? _drivingLicenceImage;

  @override
  void initState() {
    super.initState();
    _model = EditProfileModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source, String document) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: source);
    setState(() {
      if (document == 'aadhar') {
        _aadharCardImage = pickedImage;
      } else if (document == 'pan') {
        _panCardImage = pickedImage;
      } else if (document == 'driving') {
        _drivingLicenceImage = pickedImage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double topPadding = size.height * 0.1;
    final double sidePadding = size.width * 0.05;

    return Scaffold(
      key: scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
  pinned: true,
  expandedHeight: topPadding + 50,
  flexibleSpace: FlexibleSpaceBar(
    background: Align(
      alignment: const AlignmentDirectional(-1, 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 301,
          height: 114.43,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.1376, 0.5174, 0.8403, 1.1206],
              colors: [
                Color(0xFF09545E),
                Color(0xFF0C7785),
                Color(0x8309545E),
                Color(0x00054C66),
              ],
              transform: GradientRotation(90.3 * (3.1415927 / 90)),
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.elliptical(0, 100),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Text(
                'Manage Documents',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Goldman',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
  leading: GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: const Icon(
      Icons.arrow_back,
      color: Colors.white,
    ),
  ),
),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    sidePadding - 15,
                    topPadding - 60,
                    sidePadding,
                    10,
                  ),
                  child: const Text(
                    'Manage Document',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    sidePadding,
                    topPadding - 60,
                    sidePadding,
                    10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Aadhar Card',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () =>
                            _pickImage(ImageSource.gallery, 'aadhar'),
                        child: _aadharCardImage == null
                            ? Icon(
                                Icons.add_circle_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                                size: 40,
                              )
                            : Image.file(
                                File(_aadharCardImage!.path),
                                height: 150.0,
                                width: 100.0,
                              ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    sidePadding,
                    topPadding - 60,
                    sidePadding,
                    10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pan Card',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => _pickImage(ImageSource.gallery, 'pan'),
                        child: _panCardImage == null
                            ? Icon(
                                Icons.add_circle_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                                size: 40,
                              )
                            : Image.file(
                                File(_panCardImage!.path),
                                height: 150.0,
                                width: 100.0,
                              ),
                      ),
                    ],
                  ),
                ),
              
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    sidePadding,
                    topPadding - 60,
                    sidePadding,
                    10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Driving Licence',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () =>
                            _pickImage(ImageSource.gallery, 'driving'),
                        child: _drivingLicenceImage == null
                            ? Icon(
                                Icons.add_circle_outline,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.color,
                                size: 40,
                              )
                            : Image.file(
                                File(_drivingLicenceImage!.path),
                                height: 150.0,
                                width: 100.0,
                              ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    sidePadding,
                    topPadding - 60,
                    sidePadding,
                    10,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0.25),
                    child: SizedBox(
                      width: 317,
                      height: 55,
                      child: TextButton(
                        onPressed: () {
                          // Add your submit logic here
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(73),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF2A76D0),
                                Color(0xFF8A5EEA),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    sidePadding,
                    topPadding - 60,
                    sidePadding,
                    10,
                  ),
                  child: Align(
                alignment: const AlignmentDirectional(0, 0.9),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHome()),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.14,
                    height: MediaQuery.of(context).size.width * 0.14,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/images/home.png',
                        fit: BoxFit.cover,
                      ),
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
  }
}
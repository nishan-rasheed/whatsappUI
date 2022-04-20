import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];

class CameraDetails extends StatefulWidget {
  const CameraDetails({Key? key}) : super(key: key);

  @override
  State<CameraDetails> createState() => _CameraDetailsState();
}

class _CameraDetailsState extends State<CameraDetails> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  Future<void>? cameraValue;

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
    print(cameraValue);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
         children: [
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_cameraController);
            }
            return CircularProgressIndicator();
          },
          future: cameraValue,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.only(top: 10.0),
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.flash_off,
                      color: Colors.white,
                      size: 30,
                      ),  
                    ),
                    
                    InkWell(
                      onTap: (){},
                      child: Icon(
                        Icons.panorama_fish_eye,
                      color: Colors.white,
                      size: 70,
                      ), 
                    ),
                    IconButton(onPressed: (){
                     setState(() {
                       
                       cameras[0] = cameras[1];
                      
                     });
                     },
                     icon: Icon(Icons.flip_camera_ios_rounded,
                     color: Colors.white,size: 30,),),
                  ],
                ),
                Text('hold for video & tap for photo',
                style: TextStyle(
                  color: Colors.white,
                ),),
              ],
            ),
            
          ),
        )
      ]),
    );
  }
}

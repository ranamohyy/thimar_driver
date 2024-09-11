import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImage extends StatelessWidget {
  final String url;
  final double?height, width;
  final BoxFit ?fit;
  final Color?color;
  final BorderRadiusGeometry borderRadius ;

 const  AppImage ({super.key, required this.url, this.height, this.width, this.fit, this.color,this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius:borderRadius ,
      child: ((){

        if(url.startsWith("http")) {
          return Image.network(
            url,
            height: height,
            width: width,
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => const Text("error"),
          );


        }
        // else if(url.runtimeType("assets/images/")) {
        //  return Image.asset(
        //    url
        //     ,
        //     height:height?.h ,
        //     width: width?.w,
        //     fit:BoxFit.scaleDown ,
        //     color: color,
        //     errorBuilder:(context, error, stackTrace) => const Text("eror") ,
        //
        //   );
        // }

        else  {
        return  Image.asset(
          "assets/images/$url"
            ,
            height:height?.h ,
            width: width?.w,
            fit:BoxFit.scaleDown ,
            color: color,
            errorBuilder:(context, error, stackTrace) => const Text("eror") ,

          );
        }

      })(),
    );





















  }
}

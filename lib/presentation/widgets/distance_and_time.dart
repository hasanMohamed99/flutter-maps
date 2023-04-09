import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:flutter_maps/data/models/place_directions.dart';

class DistanceAndTime extends StatelessWidget {
  final PLaceDirections? pLaceDirections;
  final bool isTimeAndDistanceVisible;
  const DistanceAndTime({
    Key? key,
    this.pLaceDirections,
    required this.isTimeAndDistanceVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isTimeAndDistanceVisible,
      child: Positioned(
        top: 0,
        bottom: MediaQuery.of(context).size.height/1.7,
        left: 0,
        right: 0,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  
                ),
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: const Icon(Icons.access_time_filled, color: MyColors.blue, size: 30,),
                  title: Text(
                    pLaceDirections!.totalDuration,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20,),
            Flexible(
              flex: 1,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),

                ),
                margin: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                color: Colors.white,
                child: ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  leading: const Icon(Icons.directions_car_filled, color: MyColors.blue, size: 30,),
                  title: Text(
                    pLaceDirections!.totalDistance,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/homepage/homepage_model/feed_model.dart';

var log = getLogger('HomepageController');

class HomepageController extends GetxController {
  List<FeedModel> feedData = [
    // sampleFeedData2,
    // sampleFeedData3,
    // sampleFeedData0,
    // sampleFeedData1,
    // sampleFeedData4
  ];

  getFeeds() async {
    log.w("getting feeds");
    await refreshFeeds();
    update();
  }

  Future<void> refreshFeeds() async {
    // DatabaseReference toponysFeedsRef = FirebaseDatabase.instance.ref("toponym_data");
    final toponysFeedsRef = FirebaseDatabase.instance.ref("toponym_data");

    toponysFeedsRef.onChildAdded.listen((event) {
      FeedModel toponysFeed =
          feedModelFromJson(jsonEncode(event.snapshot.value).toString());

      feedData.add(toponysFeed);
      update();

      // log.wtf("Length of returned feeds: ${event.snapshot}");
      log.wtf("returned feeds: ${toponysFeed.toJson()}");
      log.d("Going again");
    });
  }
}

import 'package:flutter/material.dart';
import 'package:rick_and_morty/recources/image.dart';
import 'package:rick_and_morty/screens/person_deail_screen/widgets/list_episode.dart';

List<Widget> episodList() {
    List<Widget> list = [];
    for (int i = 0; i < images.episodes.length; i++) {
      list.add(SizedBox(
        height: 24,
      ));
      list.add(listEpisod(i));
    }
    return list;
  }
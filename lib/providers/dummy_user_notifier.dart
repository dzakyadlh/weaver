import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weaver/models/weavee.dart';

part 'dummy_user_notifier.g.dart';

@riverpod
class DummyUserNotifier extends _$DummyUserNotifier {
  @override
  FutureOr<Weavee?> build() async {
    return await _fetchUser();
  }

  Future<Weavee?> _fetchUser() async {
    state = const AsyncValue.loading();
    const jsonString = '''
    {
        "id": "user_123",
        "email": "adomination@example.com",
        "name": "Ado",
        "username": "adomination",
        "imageUrl": "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy/ado.jpg",
        "bio": "Just another user posting stuff.",
        "posts":[
    {
      "id": "123",
      "caption": "Lorem ipsum dolor sit amet i dont know lol whatever lmao",
      "likes": 123223,
      "updated_at": "2023-10-05T12:34:56Z",
      "media": [
        {
          "id": "id",
          "url": "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy//ado.jpg",
          "type": "image"
        }
      ],
      "comments": [],
      "user": {
        "id": "user_123",
        "email": "adomination@example.com",
        "name": "Ado Min",
        "username": "adomination",
        "imageUrl": "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy//ado.jpg",
        "bio": "Just another user posting stuff.",
        "posts": []
      }
    },
    {
      "id": "124",
      "caption": "Another post because why not?",
      "likes": 45678,
      "updated_at": "2023-10-05T13:45:00Z",
      "media": [
        {
          "id": "id2",
          "url": "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy//ado.jpg",
          "type": "image"
        }
      ],
      "comments": [],
      "user": {
        "id": "user_123",
        "email": "adomination@example.com",
        "name": "Ado Min",
        "username": "adomination",
        "imageUrl": "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy//ado.jpg",
        "bio": "Just another user posting stuff.",
        "posts": []
      }
    },
    {
      "id": "125",
      "caption": "Another post because why not?",
      "likes": 45678,
      "updated_at": "2023-10-05T13:45:00Z",
      "media": [],
      "comments": [],
      "user": {
        "id": "user_123",
        "email": "adomination@example.com",
        "name": "Ado Min",
        "username": "adomination",
        "imageUrl": "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy//ado.jpg",
        "bio": "Just another user posting stuff.",
        "posts": []
      }
    },
    {
      "id": "126",
      "caption": "Yet another post for the sake of it.",
      "likes": 98765,
      "updated_at": "2023-10-05T14:50:30Z",
      "media": [
        {
          "id": "id3",
          "url": "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy//ado.jpg",
          "type": "image"
        }
      ],
      "comments": [],
      "user": {
        "id": "user_123",
        "email": "adomination@example.com",
        "name": "Ado Min",
        "username": "adomination",
        "imageUrl": "https://ncmqrjmwofkrysnskwqw.supabase.co/storage/v1/object/public/dummy//ado.jpg",
        "bio": "Just another user posting stuff.",
        "posts": []
      }
    }
  ]
    }
    ''';

    try {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;

      // await Future.delayed(const Duration(seconds: 2));
      final userData = Weavee.fromJson(jsonMap);
      state = AsyncValue.data(userData);
      return userData;
    } catch (e, stackTrace) {
      debugPrint('Error parsing JSON: $e');
      state = AsyncValue.error(e, stackTrace);
      return null;
    }
  }
}

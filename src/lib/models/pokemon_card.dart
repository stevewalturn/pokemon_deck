import 'package:equatable/equatable.dart';

class PokemonCard {
  final String id;
  final String name;
  final String imageUrl;
  final String type; 
  final String rarity;
  final String description;
  final int hp;
  final List<String> attacks;
  final String weakness;
  final String resistance;

  const PokemonCard({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.rarity,
    required this.description,
    required this.hp,
    required this.attacks,
    required this.weakness,
    required this.resistance,
  });

  factory PokemonCard.fromJson(Map<String, dynamic> json) {
    return PokemonCard(
      id: json['id'] as String,
      name: json['name'] as String, 
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
      rarity: json['rarity'] as String,
      description: json['description'] as String,
      hp: json['hp'] as int,
      attacks: List<String>.from(json['attacks'] as List),
      weakness: json['weakness'] as String,
      resistance: json['resistance'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'type': type,
      'rarity': rarity, 
      'description': description,
      'hp': hp,
      'attacks': attacks,
      'weakness': weakness,
      'resistance': resistance,
    };
  }
}
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokemon_deck/features/home/models/pokemon_card_model.dart';
import 'package:pokemon_deck/features/home/widgets/pokemon_card_widget.dart';

class SwipableDeckWidget extends StatefulWidget {
  final List<PokemonCard> cards;
  final Function(PokemonCard) onSwipeLeft;
  final Function(PokemonCard) onSwipeRight;

  const SwipableDeckWidget({
    required this.cards,
    required this.onSwipeLeft,
    required this.onSwipeRight,
    Key? key,
  }) : super(key: key);

  @override
  State<SwipableDeckWidget> createState() => _SwipableDeckWidgetState();
}

class _SwipableDeckWidgetState extends State<SwipableDeckWidget> {
  double _dragPosition = 0;
  double _dragRotation = 0;
  double _scale = 1;

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.delta.dx;
      _dragRotation = _dragPosition / 300;
      _scale = 1 - min((_dragPosition.abs() / 1500), 0.2);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_dragPosition.abs() > 100) {
      if (_dragPosition > 0) {
        widget.onSwipeRight(widget.cards.first);
      } else {
        widget.onSwipeLeft(widget.cards.first);
      }
    }
    setState(() {
      _dragPosition = 0;
      _dragRotation = 0;
      _scale = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isEmpty) {
      return const Center(
        child: Text(
          'No more cards',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
    }

    return Stack(
      children: [
        if (widget.cards.length > 1)
          Positioned(
            top: 5,
            left: 5,
            right: 5,
            child: Transform.scale(
              scale: 0.9,
              child: PokemonCardWidget(
                card: widget.cards[1],
              ),
            ),
          ),
        GestureDetector(
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
          child: Transform.translate(
            offset: Offset(_dragPosition, 0),
            child: PokemonCardWidget(
              card: widget.cards.first,
              rotation: _dragRotation,
              scale: _scale,
            ),
          ),
        ),
      ],
    );
  }
}

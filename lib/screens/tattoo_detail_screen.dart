import 'package:flutter/material.dart';
import '../models/tattoo_model.dart';

class TattooDetailScreen extends StatefulWidget {
  final TattooModel tattoo;

  const TattooDetailScreen({
    super.key,
    required this.tattoo,
  });

  @override
  State<TattooDetailScreen> createState() => _TattooDetailScreenState();
}

class _TattooDetailScreenState extends State<TattooDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final tattoo = widget.tattoo;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0E12),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 430,
            pinned: true,
            backgroundColor: const Color(0xFF0F0E12),
            leading: Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Colors.black.withValues(alpha: 0.55),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withValues(alpha: 0.55),
                  child: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: isFavorite
                          ? const Color(0xFFFF7EA8)
                          : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                tattoo.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF211D25),
                    child: const Icon(
                      Icons.image_outlined,
                      color: Colors.white38,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF29202E),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tattoo.category,
                          style: const TextStyle(
                            color: Color(0xFFE7B8FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFD166),
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        tattoo.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    tattoo.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.brush_outlined,
                        color: Colors.white54,
                        size: 17,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        tattoo.artist,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'About this design',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tattoo.description,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF19171D),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF2D2932),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.payments_outlined,
                          color: Color(0xFFE7B8FF),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Estimated price',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Starting from',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          tattoo.price,
                          style: const TextStyle(
                            color: Color(0xFFE7B8FF),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Design saved to your collection ✨'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      icon: const Icon(Icons.bookmark_add_outlined),
                      label: const Text(
                        'Save Design',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE7B8FF),
                        foregroundColor: const Color(0xFF17131A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
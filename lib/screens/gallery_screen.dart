import 'package:flutter/material.dart';

import '../data/tattoo_data.dart';
import '../widgets/category_chip.dart';
import '../widgets/tattoo_card.dart';
import 'tattoo_detail_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> categories = [
    'All',
    'Minimal',
    'Floral',
    'Geometric',
    'Lettering',
    'Tribal',
  ];

  String selectedCategory = 'All';
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredDesigns = tattooDesigns.where((tattoo) {
      final categoryMatch =
          selectedCategory == 'All' || tattoo.category == selectedCategory;

      final searchMatch = tattoo.title.toLowerCase().contains(
        searchText.toLowerCase(),
      );

      return categoryMatch && searchMatch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0F0E12),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'INK & ART',
                                style: TextStyle(
                                  color: Color(0xFFE7B8FF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 3,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Find your next\nsignature design.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  height: 1.1,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            color: const Color(0xFF19171D),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: const Icon(
                            Icons.favorite_border_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF19171D),
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(
                          color: const Color(0xFF2D2932),
                        ),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Search designs...',
                          hintStyle: TextStyle(color: Colors.white38),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Color(0xFFE7B8FF),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    SizedBox(
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          return CategoryChip(
                            label: category,
                            selected: selectedCategory == category,
                            onTap: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Row(
                      children: [
                        Text(
                          'Featured Designs',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Explore',
                          style: TextStyle(
                            color: Color(0xFFE7B8FF),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            if (filteredDesigns.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Center(
                    child: Text(
                      'No designs found',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final tattoo = filteredDesigns[index];

                      return TattooCard(
                        tattoo: tattoo,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TattooDetailScreen(
                                tattoo: tattoo,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    childCount: filteredDesigns.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.70,
                  ),
                ),
              ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
          ],
        ),
      ),
    );
  }
}
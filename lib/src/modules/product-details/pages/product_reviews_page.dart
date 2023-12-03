import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:soodboard/src/modules/product-details/components/review_component.dart';
import 'package:soodboard/src/modules/product-details/providers/product_review_provider.dart';
import 'package:vrouter/vrouter.dart';

class ProductReviewsPage extends StatelessWidget {
  const ProductReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = context.vRouter.pathParameters['id'] ?? '';
    return ChangeNotifierProvider(
      create: (context) => ProductReviewsProvider(
        context: context,
        productId: productId,
      ),
      child: const _ProductReviewsPage(),
    );
  }
}

class _ProductReviewsPage extends StatelessWidget {
  const _ProductReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductReviewsProvider>();
    final staticProvider = context.read<ProductReviewsProvider>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.vRouter.pop(),
          icon: SvgPicture.asset("assets/icons/Left.svg"),
        ),
        title: Text(
          provider.loadingReviews
              ? "Loading Data"
              : provider.reviews.isEmpty
                  ? "No Reviews"
                  : "${provider.reviews.length} Reviews",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              child: provider.loadingReviews
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: provider.reviews.length,
                      itemBuilder: (context, index) => ReviewComponent(review: provider.reviews[index]),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: staticProvider.goToAddReview,
              child: Container(
                height: 57,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Write Review",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

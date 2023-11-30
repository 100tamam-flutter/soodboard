// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:soodboard/src/modules/home_screen/components/recommended_products_panel.dart';
// import 'package:soodboard/src/modules/offer_screen/providers/offer_screen_provider.dart';
//
// class OfferScreen extends StatelessWidget {
//   const OfferScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => OfferScreenProvider(context),
//       child: const _OfferScreen(),
//     );
//   }
// }
//
// class _OfferScreen extends StatelessWidget {
//   const _OfferScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = context.watch<OfferScreenProvider>();
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 1,
//         leading: const Icon(
//           Icons.keyboard_arrow_left,
//           size: 24,
//           color: Color(0xFF9098B1),
//         ),
//         title: Text(
//           "Super Flash Sale",
//           style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                 fontSize: 16,
//               ),
//         ),
//         titleSpacing: 12,
//         actions: [
//           Container(
//             margin: const EdgeInsets.all(16),
//             child: InkWell(
//               child: SvgPicture.asset("icons/Search_2.svg"),
//               onTap: () {},
//             ),
//           )
//         ],
//       ),
//       body: provider.loading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView(
//               children: [
//                 const SizedBox(height: 20),
//                 RecommendedProductsPanel(
//                   products: provider.products,
//                 ),
//               ],
//             ),
//     );
//   }
// }

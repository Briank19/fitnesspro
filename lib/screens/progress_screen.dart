import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oya_gym/widgets/primary_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final Uri _url =
      Uri.parse('https://chpter.co/checkout/paypage/link-64agCUyXULOTLt56pE/');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Column(
        children: [
          Lottie.asset(
            'assets/lottie/bench-press.json',
            height: 500,
            width: 500,
          ),
          ElevatedButton(
            onPressed: () {
              // https://chpter.co/checkout/paypage/link-64agCUyXULOTLt56pE/
              _launchUrl();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const PrimaryText(
              text: 'Support Harvey Investments',
              color: Colors.white,
              // fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse("https://buy.stripe.com/dR6eVv5Bx4Et2mQ4gh"));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade600,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const PrimaryText(
              text: 'Support Harvey Investments By Card',
              color: Colors.white,
              // fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    launchUrl(_url);
    // if (!await launchUrl(_url)) {
    //   throw Exception('Could not launch $_url');
    // }
  }
}

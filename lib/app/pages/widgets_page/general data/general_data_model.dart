import 'package:flutter/material.dart';

class CryptoDataModel {
  final String coinName;
  String? shortName;
  String? price;
  String? statusPercentage;
  String? imagePath;
  Gradient? chartColor;
  Color? percentageColor;

  CryptoDataModel({
    required this.coinName,
    this.shortName,
    this.price,
    this.statusPercentage,
    this.imagePath,
    this.chartColor,
    this.percentageColor,
  });

  @override
  String toString() => 'CryptoDataModel(coinName: $coinName, shortName: $shortName, price: $price, statusPercentage: $statusPercentage, imagePath: $imagePath)';
}

class CoinList {
  static List<CryptoDataModel> cryptoList = [
    CryptoDataModel(
      coinName: 'Bitcoin',
      shortName: 'BTC',
      price: '\$45,138',
      statusPercentage: '+27%',
      imagePath: _logo[0],
      chartColor: LinearGradient(
        colors: [
          const Color(0xffF98C08),
          const Color(0xffF98C08).withOpacity(0.66),
          const Color(0xffF98C08).withOpacity(0),
        ],
      ),
      percentageColor: const Color(0xff45B369),
    ),
    CryptoDataModel(
      coinName: 'Solana',
      shortName: 'SOL',
      price: '\$200',
      statusPercentage: '+25%',
      imagePath: _logo[1],
      chartColor: LinearGradient(colors: [
        const Color(0xffC817F8).withOpacity(0.39),
        const Color(0xffC817F8).withOpacity(0),
      ]),
      percentageColor: const Color(0xff45B369),
    ),
    CryptoDataModel(
      coinName: 'Ethereum',
      shortName: 'ETH',
      price: '\$3,200',
      statusPercentage: '-20%',
      imagePath: _logo[2],
      chartColor: LinearGradient(colors: [
        const Color(0xff5F80FF),
        const Color(0xff5F80FF).withOpacity(0.66),
        const Color(0xff5F80FF).withOpacity(0),
      ]),
      percentageColor: const Color(0xffEF4A00),
    ),
    CryptoDataModel(
      coinName: 'Statistic',
      shortName: 'Visits By Day',
      price: '20K',
      chartColor: LinearGradient(colors: [
        const Color(0xFF7500FD),
        const Color(0xFF7500FD).withOpacity(0),
      ]),
    ),
  ];
}

const List<String> _logo = [
  'https://raw.githubusercontent.com/iamtoricool/static_images/5726577c187e53a1436b47dcc0c113ced6bcf9f2/icons/crypto_icons/bitcoin_icon.svg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/5726577c187e53a1436b47dcc0c113ced6bcf9f2/icons/crypto_icons/solana_icon.svg',
  'https://raw.githubusercontent.com/iamtoricool/static_images/5726577c187e53a1436b47dcc0c113ced6bcf9f2/icons/crypto_icons/ethereum_icon.svg',
];

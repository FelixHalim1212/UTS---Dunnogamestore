import 'package:flutter/material.dart';

List listMetodepembayaran = [
  {
    'imgMetode': 'assets/images/metodepembayaran/mySaldo.png',
    'nameMetode': 'Saldo'
  },
  {
    'imgMetode': 'assets/images/metodepembayaran/qris.png',
    'nameMetode': 'Qris'
  },
  {'imgMetode': 'assets/images/metodepembayaran/ovo.png', 'nameMetode': 'Ovo'},
  {
    'imgMetode': 'assets/images/metodepembayaran/dana.png',
    'nameMetode': 'Dana'
  },
  {
    'imgMetode': 'assets/images/metodepembayaran/gopay.png',
    'nameMetode': 'Gopay'
  },
];
List listAllGame = [
  {
    'id': '1',
    'cover': 'assets/images/gametopup/mobile-legend.png',
    'nameGame': 'Mobile Legend Bang bang',
    'Descripsi':
        'Ayo, pimpin permainanmu dengan Diamond MLBB! Top up hanya dalam hitungan detik. Cukup masukkan ID User MLBB-mu dan pilih jumlah Diamond yang kamu inginkan. Selesaikan pembayaran dengan mudah, dan Diamond akan langsung ditambahkan ke akunmu. Jangan sampai kalah dalam pertempuran, dapatkan Diamond MLBB-mu sekarang juga!',
    'price': [
      [5, 1500],
      [11, 3300],
      [17, 5500],
      [25, 8400],
      [40, 12500],
      [53, 16800],
      [77, 24200],
      [154, 48500],
      [217, 68500],
      [256, 84300],
      [367, 116000],
      [503, 158000],
      [774, 242500],
      [1708, 527000],
      [4003, 1265500],
    ],
  },
  {
    'id': '2',
    'cover': 'assets/images/gametopup/free-fire.png',
    'nameGame': 'Free Fire',
    'Descripsi':
        'Dapatkan Diamond Free Fire (FF) dengan mudah dan cepat! Top up Diamond Kamu sekarang juga dengan hanya beberapa langkah sederhana. Masukkan Player ID Free Fire Kamu, pilih jumlah Diamond yang Kamu butuhkan, lakukan pembayaran dengan cara yang Kamu inginkan, dan Diamond akan langsung masuk ke akun Free Fire Kamu. Jadilah yang terkuat di medan pertempuran dengan Diamond yang cukup untuk membeli skin, karakter, senjata, dan aksesori keren!',
    'price': [
      [5, 1000],
      [12, 2000],
      [50, 8000],
      [70, 10000],
      [140, 20000],
      [355, 50000],
      [720, 100000],
      [1450, 200000],
      [2180, 300000],
      [3640, 500000],
      [7290, 1000000],
      [36500, 5000000],
      [73100, 10000000],
    ],
  },
  {
    'id': '3',
    'cover': 'assets/images/gametopup/genshin.png',
    'nameGame': 'Genshin Impact',
    'Descripsi':
        'Ayo, pimpin permainanmu dengan Diamond MLBB! Top up hanya dalam hitungan detik. Cukup masukkan ID User MLBB-mu dan pilih jumlah Diamond yang kamu inginkan. Selesaikan pembayaran dengan mudah, dan Diamond akan langsung ditambahkan ke akunmu. Jangan sampai kalah dalam pertempuran, dapatkan Diamond MLBB-mu sekarang juga!',
    'price': [
      [6480, 1629000],
      [3280, 815000],
      [1980, 489000],
      [980, 225000],
      [300, 81000],
      [60, 15500],
    ],
  },
  {
    'id': '4',
    'cover': 'assets/images/gametopup/pubg.png',
    'nameGame': 'PUBG Mobile',
    'Descripsi':
        'Dapatkan UC (Unknown Cash) PUBG Mobile dengan mudah dan cepat! Top up UC sekarang juga untuk mendapatkan item-item keren di dalam permainan. Masukkan Player ID PUBG Mobile Anda, pilih jumlah UC yang Anda inginkan, lakukan pembayaran dengan metode yang Anda pilih, dan UC akan langsung masuk ke akun Anda. Bersiaplah untuk bertempur di medan pertempuran dengan persediaan UC yang cukup!',
    'price': [
      [60, 7900],
      [180, 23900],
      [325, 39900],
      [660, 76900],
      [1800, 199000],
      [3850, 389000],
      [8100, 769000],
      [16200, 1529000],
      [40500, 3829000],
      [81000, 7599000],
    ],
  },
  {
    'id': '5',
    'cover': 'assets/images/gametopup/valorant.png',
    'nameGame': 'Valorant',
    'Descripsi':
        'Beli Valorant Points sekarang dan tingkatkan pengalaman bermain Valorant Anda! Dapatkan Points dalam hitungan detik dan gunakan untuk membeli karakter, senjata, dan item lainnya di dalam permainan. Pilih jumlah Valorant Points yang Anda inginkan, lakukan pembayaran dengan mudah, dan Points akan langsung masuk ke akun Anda. Jadi, siapkan diri Anda untuk pertempuran di Valorant!',
    'price': [
      [475, 49900],
      [1000, 99900],
      [2050, 199900],
      [3650, 349900],
      [5350, 499900],
      [11000, 999900],
      [15000, 1299900],
    ],
  },
  {
    'id': '6',
    'cover': 'assets/images/gametopup/fifa.png',
    'nameGame': 'FIFA Online 4',
    'Descripsi':
        'Beli Garena Shells sekarang dan gunakan untuk membeli item-item keren di FIFA Online 4! Dapatkan Shells dengan cepat dan mudah. Pilih jumlah Shells yang Anda inginkan, lakukan pembayaran dengan metode yang Anda pilih, dan Shells akan langsung masuk ke akun Anda. Jadilah pemain terbaik di FIFA Online 4 dengan persediaan Shells yang cukup!',
    'price': [
      [33, 10000],
      [66, 20000],
      [165, 50000],
      [330, 100000],
      [660, 200000],
      [1650, 500000],
      [3300, 1000000],
      [8250, 2500000],
    ],
  },
  {
    'id': '7',
    'cover': 'assets/images/gametopup/clash-royale.png',
    'nameGame': 'Clash Royale',
    'Descripsi':
        'Dapatkan Gems Clash Royale dengan mudah dan tingkatkan kemampuan pertempuran Anda! Top up Gems sekarang juga dan gunakan untuk membuka Chest, membeli Gold, dan meningkatkan kartu Anda. Pilih jumlah Gems yang Anda inginkan, lakukan pembayaran dengan cepat, dan Gems akan langsung masuk ke akun Clash Royale Anda. Siapkan diri Anda untuk pertarungan epik di Clash Royale!',
    'price': [
      [80, 10000],
      [500, 50000],
      [1200, 100000],
      [2500, 200000],
      [6500, 500000],
      [14000, 1000000],
    ],
  },
  {
    'id': '8',
    'cover': 'assets/images/gametopup/fortnite.png',
    'nameGame': 'Fortnite',
    'Descripsi':
        'Beli V-Bucks Fortnite sekarang dan tunjukkan gaya Anda di dalam permainan! Dapatkan V-Bucks dalam hitungan detik dan gunakan untuk membeli item-item kosmetik, Battle Pass, dan lainnya. Pilih jumlah V-Bucks yang Anda inginkan, lakukan pembayaran dengan mudah, dan V-Bucks akan langsung masuk ke akun Fortnite Anda. Bersiaplah untuk bertahan hidup dan jadi yang terakhir berdiri di Fortnite!',
    'price': [
      [1000, 99900],
      [2800, 249900],
      [5000, 399900],
      [13500, 999900],
      [28000, 1999900],
      [75000, 4999900],
      [135000, 8999900],
    ],
  },
  {
    'id': '9',
    'cover': 'assets/images/gametopup/overwatch.png',
    'nameGame': 'Overwatch',
    'Descripsi':
        'Beli Overwatch League Tokens sekarang dan dukung tim favorit Anda! Dapatkan League Tokens dalam hitungan detik dan gunakan untuk membeli skin, tag, emote, dan banyak lagi. Pilih jumlah League Tokens yang Anda inginkan, lakukan pembayaran dengan mudah, dan League Tokens akan langsung masuk ke akun Overwatch Anda. Bergabunglah dengan pertempuran tim dan buktikan kehebatan Anda di Overwatch!',
    'price': [
      [100, 99900],
      [200, 199900],
      [400, 399900],
      [900, 899900],
      [2600, 2499900],
      [5750, 4999900],
    ],
  },
  {
    'id': '10',
    'cover': 'assets/images/gametopup/codm.png',
    'nameGame': 'COD Mobile',
    'Descripsi':
        'Beli COD Points COD Mobile sekarang dan tingkatkan kekuatan Anda di medan pertempuran! Dapatkan COD Points dalam hitungan detik dan gunakan untuk membeli senjata, skin, Battle Pass, dan item lainnya. Pilih jumlah COD Points yang Anda inginkan, lakukan pembayaran dengan mudah, dan COD Points akan langsung masuk ke akun COD Mobile Anda. Bersiaplah untuk aksi intens di COD Mobile!',
    'price': [
      [80, 10000],
      [400, 50000],
      [800, 100000],
      [2000, 249000],
      [4000, 499000],
      [8000, 999000],
      [20000, 2499000],
    ],
  },
  {
    'id': '11',
    'cover': 'assets/images/gametopup/lol.png',
    'nameGame': 'League of Legends',
    'Descripsi':
        'Beli Riot Points League of Legends sekarang dan tingkatkan pengalaman bermain Anda! Dapatkan Riot Points dalam hitungan detik dan gunakan untuk membeli skin, champion, ward skin, dan item lainnya. Pilih jumlah Riot Points yang Anda inginkan, lakukan pembayaran dengan mudah, dan Riot Points akan langsung masuk ke akun League of Legends Anda. Bersiaplah untuk bertarung di medan pertempuran di League of Legends!',
    'price': [
      [500, 59900],
      [1000, 99900],
      [2000, 199900],
      [3200, 299900],
      [4400, 399900],
      [5850, 499900],
      [8000, 649900],
    ],
  },
  {
    'id': '12',
    'cover': 'assets/images/gametopup/point-blank.png',
    'nameGame': 'Point Blank',
    'Descripsi':
        'Beli Cash Point Blank sekarang dan tingkatkan kemampuan pertempuran Anda! Dapatkan Cash dalam hitungan detik dan gunakan untuk membeli senjata, karakter, item, dan aksesori di dalam permainan. Pilih jumlah Cash yang Anda inginkan, lakukan pembayaran dengan mudah, dan Cash akan langsung masuk ke akun Point Blank Anda. Bersiaplah untuk pertempuran sengit di Point Blank!',
    'price': [
      [50000, 50000],
      [100000, 100000],
      [300000, 300000],
      [500000, 500000],
      [1000000, 1000000],
      [2000000, 2000000],
      [5000000, 5000000],
      [10000000, 10000000],
    ],
  },
];

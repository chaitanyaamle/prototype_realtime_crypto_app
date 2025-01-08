import 'dart:io';

final object = [
  {
    "id": 1,
    "name": 'Bitcoin',
    "symbol": 'BTC',
    "value": 50123,
    "changePer": 0,
    "history": [50000, 52318, 50812, 49809, 50123]
  },
  {
    "id": 2,
    "name": 'Ethereum',
    "symbol": 'ETH',
    "value": 3512,
    "changePer": 0,
    "history": [3500, 3321, 3512, 3421, 3512]
  },
  {
    "id": 3,
    "name": 'Ripple',
    "symbol": 'XRP',
    "value": 0.4,
    "changePer": -1,
    "history": [1.2, 1.0, 0.9, 0.4]
  },
  {
    "id": 4,
    "name": 'Litecoin',
    "symbol": 'LTC',
    "value": 310,
    "changePer": 0,
    "history": [200, 250, 310]
  },
];

String localhost = Platform.isIOS ? "localhost" : "10.0.2.2";

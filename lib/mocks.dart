import 'package:places/domain/sight.dart';

enum SightType { cafe, hotel, restaurant, particularPlace, park, museum }

final List<Sight> mocks = [
  Sight(
    name: 'Озеро Байкал',
    lat: 51.90503,
    lon: 126.62002,
    photo:
        'https://img.gazeta.ru/files3/345/6693345/Ice-on-Lake-Baikal-pic700-700x467-66269.jpg',
    detailPhoto: 'https://russia.travel/upload/resize/435821/1280_1280/1066790.jpg',
    details:
        'Oзеро тектонического происхождения в южной части Восточной Сибири, самое глубокое озеро на планете, крупнейший природный резервуар пресной воды и самое большое по площади пресноводное озеро на континенте.',
    type: 'Особое место',
    typeEnum: SightType.particularPlace,
  ),
  Sight(
    name: 'White Rabbit',
    lat: 55.7475260,
    lon: 37.5814870,
    photo:
        'https://daauxcge0bfi7.cloudfront.net/photo/crop/rr9leatr14_960x496.jpg',
    detailPhoto:
        'https://media-cdn.tripadvisor.com/media/photo-s/1b/91/bf/b6/caption.jpg',
    details:
        'Панорамный ресторан в историческом центре Москвы авторская кухня. Шеф - повар Владимир Мухин ',
    type: 'Ресторан',
    typeEnum: SightType.restaurant,
  ),
  Sight(
    name: 'White Hobbit',
    lat: 55.7475260,
    lon: 37.5814870,
    photo:
        'https://media-cdn.tripadvisor.com/media/photo-s/1b/91/bf/b6/caption.jpg',
    details:
        'Панорамный ресторан в историческом центре Москвы авторская кухня. Шеф - повар Владимир Мухин ',
    type: 'Ресторан',
    typeEnum: SightType.restaurant,
  ),
  Sight(
    name: 'Эрмитаж',
    lat: 59.939848,
    lon: 30.314568,
    photo: 'https://topspb.tv/media/768x432/news_covers/ert-minlkhbwpo.jpg',
    detailPhoto: 'https://topspb.tv/media/768x432/news_covers/ert-minlkhbwpo.jpg',
    details:
        '3 миллиона произведений. 20 километров шедевров. А начинался Эрмитаж как частное собрание Екатерины II из 225 картин. Увидеть его могли лишь избранные, получив билет в дворцовой конторе и облачившись во фрак или мундир. ',
    type: 'Музей',
    typeEnum: SightType.museum,
  ),
  Sight(
    name: 'St. Regis Москва Никольская',
    lat: 55.753174,
    lon: 37.631136,
    photo: 'https://cf.bstatic.com/images/hotel/max1024x768/194/194428535.jpg',
    details:
        'Пятизвездочный отель «St. Regis Москва Никольская» находится в историческом особняке в самом центре столицы, всего в 10 минутах ходьбы от Красной площади. ',
    type: 'Отель',
    typeEnum: SightType.hotel,
  ),
  Sight(
    name: 'Музеон',
    lat: 55.751187,
    lon: 37.635278,
    photo:
        'https://api.parkseason.ru/images/styles/690_auto/f8/25/83186147aed5cd664fbfc9442d8632e458d8ee7a7bc59609072190.jpg',
    details:
        'Парк искусств МУЗЕОН – уникальный музей скульптуры под открытым небом. В коллекции - более 1000 скульптур ',
    type: 'Парк',
    typeEnum: SightType.park,
  ),
];

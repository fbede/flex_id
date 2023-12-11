import 'package:flex_id/flex_id.dart';

void main() {
  final pkGenerator = FlexID(minRandomCharacters: 2);

  print(pkGenerator.numberOfRandomCharacters);

  print(pkGenerator.numberOfSortableCharacters);

  print(pkGenerator.collisionInfo);

  /*  for (var i = 0; i < 100; i++) {
    print(pkGenerator.nextId);
  } */
}

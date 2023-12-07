import 'package:tiny_id/src/k_sortable.dart';
import 'package:tiny_id/tiny_id.dart';

void main() {
  final pkGenerator = TinyID(kSortable: KSortable.none, bodyLength: 21);

  print(pkGenerator.numberOfRandomCharacters);

  print(pkGenerator.numberOfSortableCharacters);

  print(pkGenerator.collisionInfo);

  /*  for (var i = 0; i < 100; i++) {
    print(pkGenerator.nextId);
  } */
}

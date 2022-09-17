import 'package:beatx_cli/src/models/route_node.dart';
import 'package:test/test.dart';

main() {
  group('Create RouteNode', () {
    test('/index.dart => root, /, empty parent', () async {
      final path = r'/my/dir/from/the/root/lib/routes/index.dart';
      final route = RouteNode.fromLibraryPath(path);
      expect(route.isRoot, isTrue);
      expect(route.parent.isEmpty, isTrue);
      expect(route.path, '/');
    });
    test('/home.dart => not root, /home, parent / ', () async {
      final path = r'/my/dir/from/the/root/lib/routes/home.dart';
      final route = RouteNode.fromLibraryPath(path);
      expect(route.parent, '/');
      expect(route.path, '/home');
      expect(route.isRoot, isFalse);
    });

    test('/home/room.dart => not root, /home/room, parent /home', () async {
      final path = r'/my/dir/from/the/root/lib/routes/home/room.dart';
      final route = RouteNode.fromLibraryPath(path);
      expect(route.parent, '/home');
      expect(route.path, '/home/room');
      expect(route.isRoot, isFalse);
    });

    test('/home.room.dart => not root, /home/room, parent /', () async {
      final path = r'/my/dir/from/the/root/lib/routes/home.room.dart';
      final route = RouteNode.fromLibraryPath(path);
      expect(route.parent, '/');
      expect(route.path, '/home/room');
      expect(route.isRoot, isFalse);
    });
    test(
        '/home/room/desk.dart with root flag => root, /home/room/desk, parent /home/room',
        () {
      final path = r'/my/dir/from/the/root/lib/routes/home/room/desk.dart';
      final route = RouteNode.fromLibraryPath(path, true);
      expect(route.parent, '');
      expect(route.path, '/home/room/desk');
      expect(route.isRoot, isTrue);
    });
    test(
        '/home/room/desk[.]drawer.dart with root flag => root, /home/room/desk.drawer, parent /home/room',
        () {
      final path =
          r'/my/dir/from/the/root/lib/routes/home/room/desk[.]drawer.dart';
      final route = RouteNode.fromLibraryPath(path, true);
      expect(route.parent, '');
      expect(route.path, '/home/room/desk.drawer');
      expect(route.isRoot, isTrue);
    });
  });
}

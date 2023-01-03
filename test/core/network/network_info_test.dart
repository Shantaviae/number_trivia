import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/network/network_info.dart';

@GenerateNiceMocks([MockSpec<DataConnectionChecker>()])
import 'network_info_test.mocks.dart';

void main() {
  late MockDataConnectionChecker mockDataConnectionChecker;
  late NetworkInfoImpl networkInfo;

  setUp(
    () {
      mockDataConnectionChecker = MockDataConnectionChecker();
      networkInfo = NetworkInfoImpl(
        dataConnectionChecker: mockDataConnectionChecker,
      );
    },
  );

  group(
    'isConnected',
    () {
      test(
        "should forward the call to DataConnectionChecker.hasConnection",
        () async {
          //arrange
          final tHasConnectionFuture = Future.value(true);
          when(mockDataConnectionChecker.hasConnection)
              .thenAnswer((_) => tHasConnectionFuture);
          //act
          final result = networkInfo.isConnected;
          //assert
          verify(mockDataConnectionChecker.hasConnection);
          expect(result, tHasConnectionFuture);
        },
      );
    },
  );
}

// Originally from https://github.com/zino-app/graphql-flutter

import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:meta/meta.dart";
import "package:gql_websocket_link/gql_websocket_link.dart";

/// Exception occurring when response parsing fails
@immutable
class WebSocketLinkParserException extends ResponseFormatException {
  final GraphQLSocketMessage message;

  const WebSocketLinkParserException({
    @required dynamic originalException,
    @required this.message,
  }) : super(
          originalException: originalException,
        );
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`
@immutable
class WebSocketLinkServerException extends ServerException {
  final GraphQLSocketMessage requestMessage;

  const WebSocketLinkServerException({
    @required dynamic originalException,
    @required Response parsedResponse,
    @required this.requestMessage,
  }) : super(
          originalException: originalException,
          parsedResponse: parsedResponse,
        );
}

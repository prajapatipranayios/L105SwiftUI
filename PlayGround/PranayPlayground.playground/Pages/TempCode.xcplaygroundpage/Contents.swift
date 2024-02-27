public func didReceive(event: Starscream.WebSocketEvent, client: Starscream.WebSocketClient) {
    switch event {
    case .connected(let headers):
        print("WebSocket connected with headers: \(headers)")
        break
    case .disconnected(let reason, let code):
        print("WebSocket disconnected with reason: \(reason), code: \(code)")
        break
    case .text(let message):
        print("Received text message: \(message)")
        // Handle the received text message
        break
    case .binary(let data):
        print("Received binary data: \(data)")
        // Handle the received binary data
        break
    case .ping(_):
        // Handle a ping event
        break
    case .pong(_):
        // Handle a pong event
        break
    case .error(let error):
        print("WebSocket error: \(error)")
        // Handle the error
        break
    case .viabilityChanged(_):
        // Handle viability changed event
        break
    case .reconnectSuggested(_):
        // Handle reconnect suggestion
        break
    case .cancelled:
        print("WebSocket connection cancelled")
        break
    case .peerClosed:
        break
    }
}

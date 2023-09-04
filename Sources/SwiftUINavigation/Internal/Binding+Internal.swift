import SwiftUI

@available(iOS 13.0, *)
extension Binding {
  func didSet(_ perform: @escaping (Value) -> Void) -> Self {
    .init(
      get: { self.wrappedValue },
      set: { newValue, transaction in
        self.transaction(transaction).wrappedValue = newValue
        perform(newValue)
      }
    )
  }
}

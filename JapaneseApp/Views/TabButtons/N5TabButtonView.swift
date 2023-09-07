//
//  N5TabButton.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/5/23.
//

import SwiftUI
import ComposableArchitecture

struct N5TabButtonView: View {
  let store: StoreOf<N5TabButtonFeature>

  var body: some View {
    NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
      NavigationLink(state: N5TabButtonFeature.Path.State.testSelection(TestSelectionFeature.State())) {
        Text("Test")
      }
    } destination: { State in
      switch State {
      case .testSelection:
        CaseLet(/N5TabButtonFeature.Path.State.testSelection,
                 action: N5TabButtonFeature.Path.Action.testSelection,
                 then: TestSelectionView.init(store:))
      }
    }
  }
}

struct N5TabButton_Previews: PreviewProvider {
  static var previews: some View {
    N5TabButtonView(store: Store(initialState: N5TabButtonFeature.State(),
                             reducer: { N5TabButtonFeature() }))
  }
}

//
//  N5GrammarTest.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/8/23.
//

import SwiftUI
import ComposableArchitecture

struct N5GrammarTest: View {
  let store: StoreOf<N5GrammarTestFeature>

  var body: some View {
    Text("N5 Grammar Test")
  }
}

struct N5GrammarTest_Previews: PreviewProvider {
  static var previews: some View {
    N5GrammarTest(store: Store(initialState: N5GrammarTestFeature.State(),
                               reducer: { N5GrammarTestFeature() }))
  }
}

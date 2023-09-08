//
//  N5KanjiTest.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/8/23.
//

import SwiftUI
import ComposableArchitecture

struct N5KanjiTest: View {
  let store: StoreOf<N5KanjiTestFeature>

  var body: some View {
    Text("N5 Kanji Test")
  }
}

struct N5KanjiTest_Previews: PreviewProvider {
  static var previews: some View {
    N5KanjiTest(store: Store(initialState: N5KanjiTestFeature.State(),
                             reducer: { N5KanjiTestFeature() }))
  }
}

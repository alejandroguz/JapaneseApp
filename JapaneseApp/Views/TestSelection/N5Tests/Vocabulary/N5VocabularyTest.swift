//
//  N5VocabularyTest.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/8/23.
//

import SwiftUI
import ComposableArchitecture

struct N5VocabularyTest: View {
  let store: StoreOf<N5VocabularyTestFeature>

  var body: some View {
    Text("N5 Vocabulary Test")
  }
}

struct N5VocabularyTest_Previews: PreviewProvider {
  static var previews: some View {
    N5VocabularyTest(store: Store(initialState: N5VocabularyTestFeature.State(), reducer: { N5VocabularyTestFeature() }))
  }
}
